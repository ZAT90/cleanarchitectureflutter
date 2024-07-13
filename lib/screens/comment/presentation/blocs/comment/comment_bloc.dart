import 'package:cleanarchitectureflutter/core/network/network_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.dart';
part 'comment_event.dart';
part 'comment_bloc.freezed.dart';

class CommentBloc extends Bloc<CommentEvent,CommentState>{
  CommentBloc() : super(const CommentState.initial()){
    
  }
}