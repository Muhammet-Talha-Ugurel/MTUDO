import 'package:flutter/foundation.dart';
import 'package:mtudo/models/ModelProvider.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {}
