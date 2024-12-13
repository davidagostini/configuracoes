


# Ativar IIS via Linha de Comando


~~~code

sc.exe config aspnet_state start= auto
# Habilitar ASP.NET 3.5
dism /Online /Enable-Feature /FeatureName:NetFx3 /All

# Habilitar ASP.NET 4.8
dism /online /enable-feature /featurename:IIS-ASPNET45 /all /NoRestart

# Habilitar Recursos de Segurança do IIS: Request Filtering
dism /online /enable-feature /featurename:IIS-RequestFiltering /all /NoRestart

# Habilitar Desenvolvimento de Aplicação: .NET Extensibility 3.5
dism /online /enable-feature /featurename:IIS-NetFxExtensibility /all /NoRestart

# Habilitar Ferramentas de Gerenciamento do IIS: IIS Management Console
dism /online /enable-feature /featurename:IIS-ManagementConsole /all /NoRestart

# Habilitar Recursos do Windows Process Activation Service: Process Model
dism /online /enable-feature /featurename:WAS-ProcessModel /all /NoRestart

# Habilitar Ambiente .NET 3.5 para o WAS
dism /online /enable-feature /featurename:WAS-WindowsActivationService /NoRestart 
dism /online /enable-feature /featurename:WAS-ProcessModel /NoRestart 
dism /online /enable-feature /featurename:WAS-NetFxEnvironment /NoRestart 
dism /online /enable-feature /featurename:WAS-ConfigurationAPI /NoRestart 

dism /online /enable-feature /featurename:MSMQ /NoRestart
dism /online /enable-feature /featurename:MSMQ-Services /NoRestart
dism /online /enable-feature /featurename:MSMQ-Server /NoRestart

# Habilitar Ambiente .NET 3.5
# Habilitar HTTP Activation
dism /online /enable-feature /featurename:WCF-HTTP-Activation /All
# Habilitar Non-HTTP Activation
dism /online /enable-feature /featurename:WCF-NonHTTP-Activation /All
 

# Habilitar WCF HTTP Activation
dism /online /enable-feature /featurename:WCF-HTTP-Activation45 /All /NoRestart

# Habilitar MSMQ Activation para o WCF
dism /online /enable-feature /featurename:WCF-MSMQ-Activation45 /All /NoRestart

# Habilitar Named Pipe Activation para o WCF
dism /online /enable-feature /featurename:WCF-Pipe-Activation45 /All /NoRestart

# Habilitar TCP Activation para o WCF
dism /online /enable-feature /featurename:WCF-TCP-Activation45 /All /NoRestart



# Instalar funcionalidades do IIS - Common HTTP Features
dism /online /enable-feature /featurename:IIS-HttpRedirect /NoRestart 
dism /online /enable-feature /featurename:IIS-WebDAV /NoRestart

# Instalar funcionalidades do IIS - Health and Diagnostics
dism /online /enable-feature /featurename:IIS-CustomLogging /NoRestart 
dism /online /enable-feature /featurename:IIS-LoggingLibraries /NoRestart 
dism /online /enable-feature /featurename:IIS-ODBCLogging /NoRestart 
dism /online /enable-feature /featurename:IIS-RequestMonitor /NoRestart 
dism /online /enable-feature /featurename:IIS-HttpTracing /NoRestart

# Instalar funcionalidades do IIS - Performance
dism /online /enable-feature /featurename:IIS-HttpCompressionDynamic /NoRestart

# Instalar funcionalidades do IIS - Security
dism /online /enable-feature /featurename:IIS-BasicAuthentication /NoRestart 
dism /online /enable-feature /featurename:IIS-CertProvider /NoRestart
dism /online /enable-feature /featurename:IIS-ClientCertificateMappingAuthentication /NoRestart 
dism /online /enable-feature /featurename:IIS-DigestAuthentication /NoRestart 
dism /online /enable-feature /featurename:IIS-IISCertificateMappingAuthentication /NoRestart 
dism /online /enable-feature /featurename:IIS-IPSecurity /NoRestart 
dism /online /enable-feature /featurename:IIS-URLAuthorization /NoRestart 
dism /online /enable-feature /featurename:IIS-WindowsAuthentication /NoRestart

# Instalar funcionalidades do IIS - Application Development
dism /online /enable-feature /featurename:IIS-ApplicationInit /NoRestart 
dism /online /enable-feature /featurename:IIS-NetFxExtensibility /NoRestart 
dism /online /enable-feature /featurename:IIS-ASPNET /NoRestart 
dism /online /enable-feature /featurename:IIS-ServerSideIncludes /NoRestart 
dism /online /enable-feature /featurename:IIS-WebSockets /NoRestart


dism /online /enable-feature /featurename:IIS-ManagementScriptingTools     /NoRestart
dism /online /enable-feature /featurename:IIS-ManagementService /NoRestart

~~~
 
