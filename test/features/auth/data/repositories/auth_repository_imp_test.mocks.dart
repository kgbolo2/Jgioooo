// Mocks generated by Mockito 5.4.2 from annotations
// in waterbus/test/features/auth/data/repositories/auth_repository_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i5;

// Package imports:
import 'package:auth/models/auth_payload_model.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// Project imports:
import 'package:waterbus/features/auth/data/models/user_model.dart' as _i3;

import 'package:waterbus/features/auth/data/datasources/auth_local_datasource.dart'
    as _i2;
import 'package:waterbus/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [AuthLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthLocalDataSource extends _i1.Mock
    implements _i2.AuthLocalDataSource {
  @override
  void saveUserModel(_i3.UserModel? userModel) => super.noSuchMethod(
        Invocation.method(
          #saveUserModel,
          [userModel],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void saveTokens({
    required String? accessToken,
    required String? refreshToken,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #saveTokens,
          [],
          {
            #accessToken: accessToken,
            #refreshToken: refreshToken,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void clearUser() => super.noSuchMethod(
        Invocation.method(
          #clearUser,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDataSource extends _i1.Mock
    implements _i4.AuthRemoteDataSource {
  @override
  _i5.Future<(String, String)> refreshToken() => (super.noSuchMethod(
        Invocation.method(
          #refreshToken,
          [],
        ),
        returnValue: _i5.Future<(String, String)>.value(('', '')),
        returnValueForMissingStub: _i5.Future<(String, String)>.value(('', '')),
      ) as _i5.Future<(String, String)>);
  @override
  _i5.Future<_i3.UserModel?> signInWithSocial(
          _i6.AuthPayloadModel? authPayload) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithSocial,
          [authPayload],
        ),
        returnValue: _i5.Future<_i3.UserModel?>.value(),
        returnValueForMissingStub: _i5.Future<_i3.UserModel?>.value(),
      ) as _i5.Future<_i3.UserModel?>);
}
