workspace {

    model {
        user = person "User"
        softwareSystem = softwareSystem "Gain Data Cleansing Pipeline" {
            DataSources = group "Executable Schemas" {
                container "Bloomberg"
                container "Refinitv"
                container "WM"
                container "etc."
            }
            
            !docs docs
        }

        user -> softwareSystem "Uses"
    }

    views {
        systemContext softwareSystem "Diagram1" {
            include *
            autoLayout
        }
        container softwareSystem {
            include DataSources
            autoLayout
        }

        theme default
    }

}