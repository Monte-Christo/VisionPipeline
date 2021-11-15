workspace {

    model {
        CleansingPipeline = softwareSystem "Gain Data Cleansing Pipeline" {
            DataSources = group "Data Sources" {
                BBG = container "Bloomberg"
                Ref = container "Refinitv"
                WM = container "WM"
                Etc = container "etc."
            }
            
            DataSourceGateway = container "GraphQL Mesh"
            StagingArea = container "Document Database"
            PipelineFacade = container "GraphQL Envelop"
            FacadeImplementation = container "GraphQL Plugins"
            PipelineFunctions = group "Azure Functions" {
                F1 = container "Function 1"
                F2 = container "Function 2"
                More = container "..."
                Fn = container "Function n"
            }
            ValidationService = container "Validation Service"
            PublicationService = container "Publication Service"

            !docs docs
        }

        BBG -> DataSourceGateway "invokes"
        Ref -> DataSourceGateway "invokes"
        Etc -> DataSourceGateway "invokes"
        WM -> DataSourceGateway "invokes"

        DataSourceGateway -> StagingArea "stores raw data in"
        DataSourceGateway -> PipelineFacade "calls"
        PipelineFacade -> F1 "invokes"
        PipelineFacade -> F2 "invokes"
        PipelineFacade -> More "invokes"
        PipelineFacade -> Fn "invokes"

        PipelineFacade -> FacadeImplementation "is implemented by"
        PipelineFacade -> ValidationService "uses"
        PipelineFacade -> PublicationService "uses"
    }

    views {
        systemContext CleansingPipeline "SystemContext" {
            include *
            autoLayout
        }
        container CleansingPipeline "Containers" {
            include *
            autoLayout
        }

        theme default
    }

}