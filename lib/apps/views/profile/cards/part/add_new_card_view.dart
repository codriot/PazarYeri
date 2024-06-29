part of '../cards_view.dart';

class AddNewCardView extends StatefulWidget {
  const AddNewCardView({super.key});

  @override
  State<AddNewCardView> createState() => _AddNewCardViewState();
}

class _AddNewCardViewState extends State<AddNewCardView> {
  final controller = Get.find<CardController>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();

  CardType cardType = CardType.Invalid;

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      final input = CardUtils.getCleanedNumber(cardNumberController.text);
      final type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  void initState() {
    cardNumberController.addListener(
      getCardTypeFrmNumber,
    );
    super.initState();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderNameController.dispose();
    cvvController.dispose();
    expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const cardNumber = 'Kart Numarası';
    const fullName = 'Kartın Sahibi';
    const expirationDate = 'MM/YY';
    const addCard = 'Yeni Kart Ekle';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              addCard,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: ColorsProject.apricotSorbet),
            ),
            const Spacer(),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: cardNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      CardNumberInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      hintText: cardNumber,
                      suffixIcon: CardUtils.getCardIcon(cardType),
                      fillColor: ColorsProject.titanium,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: ColorsProject.apricotSorbet),
                      ),
                      filled: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      controller: cardHolderNameController,
                      decoration: const InputDecoration(
                        hintText: fullName,
                        fillColor: ColorsProject.titanium,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: ColorsProject.apricotSorbet),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cvvController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          decoration: const InputDecoration(
                            hintText: 'CVV',
                            fillColor: ColorsProject.titanium,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: ColorsProject.apricotSorbet,
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: expiryDateController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter(),
                          ],
                          decoration: const InputDecoration(
                            hintText: expirationDate,
                            fillColor: ColorsProject.titanium,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: ColorsProject.apricotSorbet,
                              ),
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                child: const Text(
                  addCard,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Form verilerini toplayın ve yeni bir kart ekleyin
                  final newCard = CreditCardModel(
                    cardNumber: cardNumberController.text,
                    expiryDate: expiryDateController.text,
                    cardHolderName: cardHolderNameController.text,
                    cvv: cvvController.text,
                  );
                  controller.addCreditCard(newCard);
                  Navigator.of(context).pop();
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    final buffer = StringBuffer();
    for (var i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
