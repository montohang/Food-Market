import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/helper/helper.dart';
import 'package:food_market/models/models.dart';
import 'package:food_market/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransactions();

    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionLoadingFailed(result.message));
    }
  }

  Future<String> submitTransaction(Transaction transaction) async {
    Transaction trans = transaction;
    PreferencesHelper pref = PreferencesHelper();
    int id = await pref.getInt('id');
    String name = await pref.getString('name');
    String picturePath = await pref.getString('picture_path');
    String email = await pref.getString('email');
    String address = await pref.getString('address');
    String houseNumber = await pref.getString('houseNumber');
    String phoneNumber = await pref.getString('phoneNumber');
    String city = await pref.getString('city');
    print(id);
    trans.copyWith(
        user: User(
            id: id,
            name: name,
            address: address,
            email: email,
            picturePath: picturePath,
            houseNumber: houseNumber,
            phoneNumber: phoneNumber,
            city: city));
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(trans);

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transactions + [result.value]));
      return result.value.paymentUrl;
    } else {
      return null;
    }
  }
}
