import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'charcters_state.dart';

class CharctersCubit extends Cubit<CharctersState> {
  CharctersCubit() : super(CharctersInitial());
}
