String getResponseErrorMessage(Map data) =>
    data['message'] as String? ??
    data['msg'] as String? ??
    data['message'] as String? ??
    'sever error';
