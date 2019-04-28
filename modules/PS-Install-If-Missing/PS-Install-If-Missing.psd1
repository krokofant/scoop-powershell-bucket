@{
    RootModule        = 'PS-Install-If-Missing.psm1'

    ModuleVersion     = '1.4'

    GUID              = 'b0d021d8-16c2-4d0a-a398-a977fce17914'

    Author            = 'Krokofant'

    Description       = "Install a powershell module if it's not already installed"

    FunctionsToExport = @('Install-IfMissing')
}
