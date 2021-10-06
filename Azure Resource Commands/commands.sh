#Create Azure Resource Group
az group create --name <YOURRESOURCEGROUPNAME> --location eastus2
#Create Azure IoT Hub
az iot hub create --name <YOURIOTHUBNAME> --resource-group <YOURRESOURCEGROUPNAME> --sku S1

#Create custom vision resource ***https://docs.microsoft.com/en-us/azure/developer/javascript/tutorial/static-web-app/create-computer-vision-resource-use-in-code?tabs=bash***
az cognitiveservices account create --resource-group <YOURRESOURCEGROUPNAME> --kind CustomVision --sku S0 --location eastus2 --name <YOURCUSTOMVISIONNAME>
az cognitiveservices account create --resource-group <YOURRESOURCEGROUPNAME> --kind CustomVisionPrediction --sku S0 --location eastus2 --name <YOURCUSTOMVISIONPREDICTIONNAME>

#Create Azure Storage Account
az storage account create --name <YOURSTORAGEACCOUNTNAME> --resource-group <YOURRESOURCEGROUPNAME> --location eastus2 --sku Standard_LRS
#Create Azure Service Bus Namespace
az servicebus namespace create --name <YOURNAMESPACENAME> --resource-group <YOURRESOURCEGROUPNAME> --location eastus2
#Create Azure Service Bus Queue
az servicebus queue create --name <YOURQUEUENAME> --resource-group <YOURRESOURCEGROUPNAME> --namespace-name <YOURNAMESPACENAME> --default-message-time-to-live 00:03:00
#Get primary connection string for Azure Service Bus Queue
az servicebus queue authorization-rule keys list --resource-group <YOURRESOURCEGROUPNAME> --namespace-name <YOURNAMESPACENAME> --queue-name <YOURQUEUENAME> --name RootManageSharedAccessKey --output tsv

#Create Azure Logic App - *** NEED THE API CONNECTIONS FOR "OUTLOOK", "TWILIO" AND "SERVICEBUS" ***
az logic workflow create --resource-group <YOURRESOURCEGROUPNAME> --location eastus2 --name <YOURLOGICAPPNAME> --definition "testDefinition.json"

