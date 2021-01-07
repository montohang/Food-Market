part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPressed: () {},
      backColor: 'FAFAFC'.toColor(),
      child: Column(
        children: [
          //// Bagian atas
          Container(
              margin: EdgeInsets.only(bottom: defaultMargin),
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Item Ordered', style: blackFontSytle3),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 60,
                              height: 60,
                              margin: EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          transaction.food.picturePath),
                                      fit: BoxFit.cover))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    2 * defaultMargin -
                                    60 -
                                    12 -
                                    78,
                                child: Text(
                                  transaction.food.name,
                                  style: blackFontSytle2,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(transaction.food.price),
                                style: greyFontSytle.copyWith(fontSize: 13),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        '${transaction.quantity} item(s)',
                        style: greyFontSytle.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Details Transaction',
                      style: blackFontSytle3,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            transaction.food.name,
                            style: greyFontSytle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(transaction.quantity +
                                    transaction.food.price),
                            style: blackFontSytle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Driver',
                            style: greyFontSytle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(50000),
                            style: blackFontSytle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Tax 10%',
                            style: greyFontSytle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(transaction.quantity *
                                    transaction.food.price *
                                    0.1),
                            style: blackFontSytle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Total',
                            style: greyFontSytle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(transaction.food.price *
                                        transaction.quantity *
                                        1.1 +
                                    50000),
                            style: blackFontSytle3.copyWith(
                                fontWeight: FontWeight.w500,
                                color: '1ABC9C'.toColor()),
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
