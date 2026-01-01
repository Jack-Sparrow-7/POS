import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class CustomEmailAuthController extends EmailAuthController {
  CustomEmailAuthController({
    required super.client,
    required super.startScreen,
    required super.onAuthenticated,
    required super.onError,
    required super.emailValidation,
    required super.passwordRequirements,
  });

  @override
  Future<void> startRegistration() async {
    final emailEndpoint = client.getEndpointOfType<EndpointEmailIdpBase>();

    try {
      final email = emailController.text.trim();
      emailValidation.call(email);

      final requestId = await emailEndpoint.startRegistration(email: email);
      final finishRequestToken = await emailEndpoint.verifyRegistrationCode(
        accountRequestId: requestId,
        verificationCode: 'jack32',
      );

      final password = passwordController.text.trim();

      final authSuccess = await emailEndpoint.finishRegistration(
        registrationToken: finishRequestToken,
        password: password,
      );

      await client.auth.updateSignedInUser(authSuccess);
      onAuthenticated?.call();

      navigateTo(
        EmailFlowScreen.completeRegistration,
        finishRequestToken: finishRequestToken,
      );
    } catch (e) {
      final userFriendlyError = convertToUserFacingException(e);
      if (userFriendlyError != null) {
        onError?.call(userFriendlyError);
      }
    }
  }
}
