// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get counterAppBarTitle => 'Contador';

  @override
  String get counterInfo => 'O valor está em:';

  @override
  String get reset => 'Reseta os valores';

  @override
  String get language => 'Altera a linguagem';

  @override
  String get theme => 'Altera o tema';

  @override
  String get increment => 'Incrementa';

  @override
  String get decrement => 'Decrementa';

  @override
  String get exit => 'Sair do App';

  @override
  String get exit_msg => 'Deseja realmente sair do App?';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get list_title => 'Lista Exemplo';

  @override
  String get detail_title => 'Detalhe';

  @override
  String get edit_profile => 'Editar Perfil';

  @override
  String get errorLoadingList => 'Erro ao carregar lista';

  @override
  String get errorInvalidCredentials => 'Usuário ou senha inválidos';

  @override
  String get errorNotAuthenticated => 'Você não está autenticado';

  @override
  String get errorUserNotFound => 'Usuário não encontrado';

  @override
  String get errorUserAlreadyExists => 'Este usuário já existe';

  @override
  String get errorNoUnit => 'Nenhuma unidade encontrada. Contate o administrador.';

  @override
  String get errorNoProfile => 'Nenhum perfil encontrado. Contate o administrador.';

  @override
  String get errorNoTeam => 'Nenhuma equipe encontrada. Contate o administrador.';

  @override
  String get errorDatabase => 'Ocorreu um erro no banco de dados. Tente novamente.';

  @override
  String get errorNetwork => 'Ocorreu um erro de rede. Tente novamente.';

  @override
  String get errorUnexpected => 'Ocorreu um erro inesperado. Tente novamente.';

  @override
  String get notDefined => 'Não definido';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get retryButton => 'Tentar Novamente';

  @override
  String get saveChangesButton => 'Salvar Alterações';

  @override
  String get profileLabel => 'Perfil';

  @override
  String get fieldRole => 'Perfil';

  @override
  String get nameLabel => 'Nome';

  @override
  String get loginLabel => 'Login';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Senha';

  @override
  String get unitLabel => 'Unidade';

  @override
  String get usernameLabel => 'Usuário';

  @override
  String get userInfoTitle => 'Informações do Usuário';

  @override
  String get nameRequired => 'Por favor, informe o nome';

  @override
  String get loginRequired => 'Por favor, informe o login';

  @override
  String get emailRequired => 'Por favor, informe o email';

  @override
  String get passwordRequired => 'Por favor, informe a senha';

  @override
  String get usernameRequired => 'Por favor, informe o usuário';

  @override
  String get loginTitle => 'Login';

  @override
  String get enterButton => 'Entrar';

  @override
  String get createAccountButton => 'Criar nova conta';

  @override
  String get createUserTitle => 'Criar Usuário';

  @override
  String get newUserTitle => 'Novo Usuário';

  @override
  String get createAccountAction => 'Criar Conta';

  @override
  String get readonlyInfoTitle => 'Informações Somente Leitura';

  @override
  String get newPasswordLabel => 'Nova Senha (opcional)';

  @override
  String get passwordHelperText => 'Deixe em branco para manter a senha atual';

  @override
  String get profileUpdatedSuccess => 'Perfil atualizado com sucesso!';

  @override
  String get logoutButton => 'Sair';

  @override
  String get logoutDialogContent => 'Deseja realmente sair do sistema?';

  @override
  String get homeTitle => 'Vitrine de Funcionalidades';

  @override
  String get homeLanguageTooltip => 'Idioma';

  @override
  String get homeThemeTooltip => 'Tema';

  @override
  String get comingSoon => 'Em breve';

  @override
  String get categoryData => 'Dados';

  @override
  String get categoryNetwork => 'Rede';

  @override
  String get categoryHardware => 'Hardware';

  @override
  String get categoryMedia => 'Mídia';

  @override
  String get categoryUI => 'UI';

  @override
  String get featureAuthTitle => 'Autenticação';

  @override
  String get featureAuthSubtitle => 'Login, cadastro e perfil';

  @override
  String get featureContactsTitle => 'Contatos';

  @override
  String get featureContactsSubtitle => 'CRUD com banco local';

  @override
  String get featureHttpListTitle => 'Lista HTTP';

  @override
  String get featureHttpListSubtitle => 'Busca de dados via REST';

  @override
  String get featureConnectivityTitle => 'Conectividade';

  @override
  String get featureConnectivitySubtitle => 'Status de rede em tempo real';

  @override
  String get featureBiometricTitle => 'Biometria';

  @override
  String get featureBiometricSubtitle => 'Impressão digital e Face ID';

  @override
  String get featureSensorsTitle => 'Sensores';

  @override
  String get featureSensorsSubtitle => 'Acelerômetro e giroscópio';

  @override
  String get featureQrCodeTitle => 'QR Code';

  @override
  String get featureQrCodeSubtitle => 'Leitor de QR e barcode';

  @override
  String get featureCameraTitle => 'Câmera';

  @override
  String get featureCameraSubtitle => 'Foto e vídeo';

  @override
  String get featureBluetoothTitle => 'Bluetooth';

  @override
  String get featureBluetoothSubtitle => 'Dispositivos BLE';

  @override
  String get featureGeoTitle => 'Geolocalização';

  @override
  String get featureGeoSubtitle => 'GPS e geocoding';

  @override
  String get featurePdfTitle => 'PDF';

  @override
  String get featurePdfSubtitle => 'Geração e visualização';

  @override
  String get featureAudioTitle => 'Áudio';

  @override
  String get featureAudioSubtitle => 'Reprodução de mídia';

  @override
  String get featureChartsTitle => 'Gráficos';

  @override
  String get featureChartsSubtitle => 'Linha, barra e pizza';

  @override
  String get featureLottiesTitle => 'Animações';

  @override
  String get featureLottiesSubtitle => 'Lottie e transições';

  @override
  String get featureCounterTitle => 'Contador';

  @override
  String get featureCounterSubtitle => 'Exemplo BLoC simples';

  @override
  String get featureHtmlTitle => 'Visualizador HTML';

  @override
  String get featureHtmlSubtitle => 'Renderizar HTML com papyrus';

  @override
  String get networkTitle => 'Conectividade';

  @override
  String get networkOnline => 'Online';

  @override
  String get networkOffline => 'Offline';

  @override
  String get networkWifi => 'Wi-Fi';

  @override
  String get networkMobile => 'Dados móveis';

  @override
  String get networkEthernet => 'Ethernet';

  @override
  String get networkBluetooth => 'Bluetooth';

  @override
  String get networkVpn => 'VPN';

  @override
  String get networkOther => 'Outra';

  @override
  String get networkNone => 'Sem conexão';

  @override
  String get networkChecking => 'Verificando...';

  @override
  String get networkStreamInfo => 'O stream atualiza automaticamente\nquando a conexão muda.';

  @override
  String get biometricTitle => 'Biometria';

  @override
  String get biometricTapToTest => 'Toque em \"Autenticar\" para testar.';

  @override
  String get biometricWaiting => 'Aguardando biometria...';

  @override
  String get biometricSuccess => 'Autenticação bem-sucedida!';

  @override
  String get biometricCancelled => 'Autenticação cancelada ou falhou.';

  @override
  String biometricErrorCheck(String message) {
    return 'Erro ao verificar biometria: $message';
  }

  @override
  String biometricAuthError(String message) {
    return 'Erro: $message';
  }

  @override
  String get biometricFaceId => 'Face ID';

  @override
  String get biometricFingerprint => 'Impressão digital';

  @override
  String get biometricIris => 'Íris';

  @override
  String get biometricStrong => 'Biometria forte';

  @override
  String get biometricWeak => 'Biometria fraca';

  @override
  String get biometricUnavailable => 'Biometria não disponível neste dispositivo ou emulador.';

  @override
  String get biometricAvailableTypes => 'Tipos disponíveis';

  @override
  String get biometricAuthButton => 'Autenticar';

  @override
  String get biometricAuthReason => 'Confirme sua identidade para continuar';

  @override
  String get qrCodeTitle => 'Leitor QR Code';

  @override
  String get qrCodeTorchTooltip => 'Lanterna';

  @override
  String get qrCodeScanPrompt => 'Aponte para um QR Code ou código de barras';

  @override
  String get qrCodeWaiting => 'Aguardando leitura...';

  @override
  String get qrCodeSuccess => 'Leitura concluída';

  @override
  String get qrCodeScanButton => 'Escanear';

  @override
  String get copyButton => 'Copiar';

  @override
  String get qrCodeCopiedMessage => 'Copiado para a área de transferência!';

  @override
  String get qrCodeNotSupported => 'O leitor de QR code não é suportado nesta plataforma.';

  @override
  String get sensorsTitle => 'Sensores';

  @override
  String get sensorsAccelerometer => 'Acelerômetro';

  @override
  String get sensorsGyroscope => 'Giroscópio';

  @override
  String get sensorsAccelerometerDesc => 'Mede a aceleração do dispositivo nos eixos X, Y e Z (m/s²).';

  @override
  String get sensorsGyroscopeDesc => 'Mede a velocidade de rotação nos eixos X, Y e Z (rad/s).';

  @override
  String get sensorsWaiting => 'Aguardando sensor...';

  @override
  String get sensorsNotSupported => 'Sensores não são suportados nesta plataforma.';

  @override
  String get chartsTitle => 'Gráficos';

  @override
  String get chartsLine => 'Linha';

  @override
  String get chartsBars => 'Barras';

  @override
  String get chartsPie => 'Pizza';

  @override
  String get chartsMonthlySales => 'Vendas mensais (×1000)';

  @override
  String get chartsQuarterlyRevenue => 'Receita trimestral (M)';

  @override
  String get chartsMobileShare => 'Market share mobile (%)';

  @override
  String get monthJan => 'Jan';

  @override
  String get monthFeb => 'Fev';

  @override
  String get monthMar => 'Mar';

  @override
  String get monthApr => 'Abr';

  @override
  String get monthMay => 'Mai';

  @override
  String get monthJun => 'Jun';

  @override
  String get chartsSectionOthers => 'Outros';

  @override
  String get lottiesTitle => 'Animações Lottie';

  @override
  String get lottiesAnimLoading => 'Carregando';

  @override
  String get lottiesAnimSuccess => 'Sucesso';

  @override
  String get lottiesAnimError => 'Erro';

  @override
  String lottiesSpeed(String speed) {
    return 'Velocidade: ${speed}x';
  }

  @override
  String get lottiesNoAssets => 'Adicione arquivos .json em\nassets/lotties/ para visualizar.';

  @override
  String get lottiesPause => 'Pausar';

  @override
  String get lottiesPlay => 'Reproduzir';

  @override
  String get lottiesRestart => 'Reiniciar';

  @override
  String get testCrashTooltip => 'Disparar exceção de teste';

  @override
  String get featureFileShareTitle => 'Compartilhar';

  @override
  String get featureFileShareSubtitle => 'Compartilhar texto e arquivos';

  @override
  String get featurePrinterTitle => 'Impressora';

  @override
  String get featurePrinterSubtitle => 'Imprimir documentos';

  @override
  String get cameraTitle => 'Câmera';

  @override
  String get cameraTakePhoto => 'Tirar Foto';

  @override
  String get cameraPickGallery => 'Escolher da Galeria';

  @override
  String get cameraNoImage => 'Nenhuma imagem selecionada';

  @override
  String get cameraNotSupported => 'Câmera não é suportada nesta plataforma.';

  @override
  String get cameraErrorPicking => 'Falha ao capturar ou selecionar imagem.';

  @override
  String get bluetoothTitle => 'Bluetooth (BLE)';

  @override
  String get bluetoothScan => 'Escanear';

  @override
  String get bluetoothStop => 'Parar';

  @override
  String get bluetoothScanning => 'Escaneando...';

  @override
  String get bluetoothNoDevices => 'Nenhum dispositivo encontrado';

  @override
  String get bluetoothDevicesFound => 'dispositivos encontrados';

  @override
  String get bluetoothNotSupported => 'Bluetooth não é suportado nesta plataforma.';

  @override
  String get bluetoothAdapterOff => 'Bluetooth está desligado. Ative-o e tente novamente.';

  @override
  String get bluetoothDeviceUnknown => 'Dispositivo desconhecido';

  @override
  String get bluetoothPairedDevices => 'Dispositivos Pareados';

  @override
  String get bluetoothNearbyDevices => 'Dispositivos Próximos';

  @override
  String get bluetoothConnected => 'Conectado';

  @override
  String get geolocationTitle => 'Geolocalização';

  @override
  String get geolocationGetPosition => 'Obter Minha Localização';

  @override
  String get geolocationLatitude => 'Latitude';

  @override
  String get geolocationLongitude => 'Longitude';

  @override
  String get geolocationAltitude => 'Altitude';

  @override
  String get geolocationAccuracy => 'Precisão';

  @override
  String get geolocationSpeed => 'Velocidade';

  @override
  String get geolocationWaiting => 'Toque no botão para obter sua localização.';

  @override
  String get geolocationLoading => 'Obtendo localização...';

  @override
  String geolocationError(String message) {
    return 'Erro: $message';
  }

  @override
  String get geolocationPermissionDenied => 'Permissão de localização negada. Ative nas configurações.';

  @override
  String get geolocationPermissionDeniedForever => 'Permissão de localização negada permanentemente. Abra as configurações do app.';

  @override
  String get geolocationServiceDisabled => 'Serviços de localização desativados. Ative o GPS e tente novamente.';

  @override
  String get pdfTitle => 'PDF';

  @override
  String get pdfPreview => 'Visualizar / Imprimir';

  @override
  String get pdfInfo => 'Toque para gerar um PDF de exemplo e abrir a prévia de impressão e compartilhamento.';

  @override
  String get fileShareTitle => 'Compartilhar';

  @override
  String get fileShareLabel => 'Conteúdo para compartilhar';

  @override
  String get fileShareHint => 'Digite algo para compartilhar...';

  @override
  String get fileShareShareButton => 'Compartilhar';

  @override
  String get fileShareEmptyError => 'Por favor, digite algo para compartilhar.';

  @override
  String get printerTitle => 'Impressora';

  @override
  String get printerPrint => 'Imprimir';

  @override
  String get printerPreview => 'Prévia';

  @override
  String get printerListLabel => 'Impressoras Disponíveis';

  @override
  String get printerNoDevices => 'Nenhuma impressora encontrada neste dispositivo.';

  @override
  String get printerPrinting => 'Enviando para a impressora...';

  @override
  String get printerSuccess => 'Documento enviado para a impressora!';

  @override
  String printerError(String message) {
    return 'Erro de impressão: $message';
  }

  @override
  String get htmlTitle => 'Visualizador HTML';

  @override
  String get htmlSampleHeading => 'Olá do Papyrus!';

  @override
  String get htmlSampleParagraph => 'Esta página é HTML puro renderizado dentro de uma WebView segura e controlada por políticas.';
}
