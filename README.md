# Terraform modules for GCP PubSub

The project contains skeleton of GCP configuration for creating topics and subscriptions for Randstad
R1 Project

The skeleton is aimed to configure the CI/CD pipeline

There are 5 custom modules
- **Topic** - configuration of individual topics. Some values are hardcoded which are not to be changed and others come
through input variables
- **Subscription** - similar to Topic - base module for creating a subscription
- **Topic with service account** - the module creates service account for publisher, a topic and iam for the publisher
- **Subscription with service account** - the module creates service account for subscriber and subscription.
It can also create dead letter topic or the dead letter topic can be provided as variable

Then there is a shared definition of the resources and configuration specific per environment driven by
environment variable. Expected values are `dev`, `tst` and `prd`.