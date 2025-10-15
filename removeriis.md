
~~~code

:: Parar o IIS antes de remover os componentes
iisreset /stop

# Desabilitar ASP.NET 3.5
dism /Online /Disable-Feature /FeatureName:NetFx3

# Desabilitar ASP.NET 4.8
dism /online /disable-feature /featurename:IIS-ASPNET45 /NoRestart

# Desabilitar Recursos de Segurança do IIS: Request Filtering
dism /online /disable-feature /featurename:IIS-RequestFiltering /NoRestart

# Desabilitar Desenvolvimento de Aplicação: .NET Extensibility 3.5 e 4.5
dism /online /disable-feature /featurename:IIS-NetFxExtensibility /NoRestart
dism /online /disable-feature /featurename:IIS-NetFxExtensibility45 /NoRestart

# Desabilitar Ferramentas de Gerenciamento do IIS
dism /online /disable-feature /featurename:IIS-ManagementConsole /NoRestart
dism /online /disable-feature /featurename:IIS-ManagementScriptingTools /NoRestart
dism /online /disable-feature /featurename:IIS-ManagementService /NoRestart

# Desabilitar Recursos do Windows Process Activation Service (WAS)
dism /online /disable-feature /featurename:WAS-ProcessModel /NoRestart
dism /online /disable-feature /featurename:WAS-NetFxEnvironment /NoRestart
dism /online /disable-feature /featurename:WAS-ConfigurationAPI /NoRestart
dism /online /disable-feature /featurename:WAS-WindowsActivationService /NoRestart

# Desabilitar Message Queuing (MSMQ)
dism /online /disable-feature /featurename:MSMQ-Server /NoRestart
dism /online /disable-feature /featurename:MSMQ-Services /NoRestart
dism /online /disable-feature /featurename:MSMQ /NoRestart

# Desabilitar WCF Activation para .NET 3.5
dism /online /disable-feature /featurename:WCF-HTTP-Activation /All
dism /online /disable-feature /featurename:WCF-NonHTTP-Activation /All

# Desabilitar WCF Activation para .NET 4.5+
dism /online /disable-feature /featurename:WCF-HTTP-Activation45 /NoRestart
dism /online /disable-feature /featurename:WCF-MSMQ-Activation45 /NoRestart
dism /online /disable-feature /featurename:WCF-Pipe-Activation45 /NoRestart
dism /online /disable-feature /featurename:WCF-TCP-Activation45 /NoRestart

# Desabilitar funcionalidades do IIS - Common HTTP Features
dism /online /disable-feature /featurename:IIS-HttpRedirect /NoRestart
dism /online /disable-feature /featurename:IIS-WebDAV /NoRestart

# Desabilitar funcionalidades do IIS - Health and Diagnostics
dism /online /disable-feature /featurename:IIS-CustomLogging /NoRestart
dism /online /disable-feature /featurename:IIS-LoggingLibraries /NoRestart
dism /online /disable-feature /featurename:IIS-ODBCLogging /NoRestart
dism /online /disable-feature /featurename:IIS-RequestMonitor /NoRestart
dism /online /disable-feature /featurename:IIS-HttpTracing /NoRestart

# Desabilitar funcionalidades do IIS - Performance
dism /online /disable-feature /featurename:IIS-HttpCompressionDynamic /NoRestart

# Desabilitar funcionalidades do IIS - Security
dism /online /disable-feature /featurename:IIS-BasicAuthentication /NoRestart
dism /online /disable-feature /featurename:IIS-CertProvider /NoRestart
dism /online /disable-feature /featurename:IIS-ClientCertificateMappingAuthentication /NoRestart
dism /online /disable-feature /featurename:IIS-DigestAuthentication /NoRestart
dism /online /disable-feature /featurename:IIS-IISCertificateMappingAuthentication /NoRestart
dism /online /disable-feature /featurename:IIS-IPSecurity /NoRestart
dism /online /disable-feature /featurename:IIS-URLAuthorization /NoRestart
dism /online /disable-feature /featurename:IIS-WindowsAuthentication /NoRestart

# Desabilitar funcionalidades do IIS - Application Development
dism /online /disable-feature /featurename:IIS-ApplicationInit /NoRestart
dism /online /disable-feature /featurename:IIS-ASPNET /NoRestart
dism /online /disable-feature /featurename:IIS-ServerSideIncludes /NoRestart
dism /online /disable-feature /featurename:IIS-WebSockets /NoRestart

# Desabilitar o IIS WebServer principal (geralmente o último passo)
DISM /Online /Disable-Feature /FeatureName:IIS-WebServer

# Parar e desabilitar o serviço de Estado do ASP.NET
sc.exe stop aspnet_state
sc.exe config aspnet_state start= disabled

~~~
