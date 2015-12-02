# ThunderBay

A Ruby on Rails application to manage devices and send iOS push notifications to be used as companion for [Acapulco](https://github.com/DimensionSrl/acapulco).

## Features

- [x] Create applications;
- [x] Parse and convert p12 certificates;
- [x] Accept device registrations;
- [x] Send push notifications;
- [x] Show device list;
- [x] Show messages list;
- [x] Accept received receipts;
- [x] Accept red receipts;
- [x] Show detailed informations for each message;
- [x] Save device coordinates, name and locale.

## Requirements

- Ruby on Rails 4.2.5
- Ruby 2.2.3

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## One click deploy on Heroku

To simplify the testing process you can deploy on Heroku with one click.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/macteo/thunderbay.git)

## Usage

### Create App

In order to send push notifications to iOS devices, you need create the certificates in the [iOS Development Portal](https://developer.apple.com/account/overview.action). For a detailed guide take a look at the [Local and Remote Notification Programming Guide](https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Introduction.html#//apple_ref/doc/uid/TP40008194-CH1-SW1).

Once you have the push notification certificate, go to the the Apps section and create a new application. Select the certificate, insert the password and if the certificate is a development one (check sandbox) or a production one (leave uncheked).

When the application is ready you get the *Identifier* that can be used as `applicationKey` in [https://github.com/DimensionSrl/acapulco](Acapulco).

### Send push message

Go to the devices tab and choose the **Send Message** button besides the device you want to send the message to.
Then fill the desired fields and then press on the **Create** button.
The push notification will be sent immediately.

### Check message status

Clicking on the **Show** button near each message, you are able to check if it has been sent, received and red.

### Endpoints

There are three main endpoints to support [https://github.com/DimensionSrl/acapulco](Acapulco).
You should perform a POST call with json parameters.

#### Register device

Each device needs to register itself and provide some informations.

```
http://THUNDERBAY_DOMAIN/apps/APPLICATION_IDENTIFIER/devices
```

`APPLICATION_IDENTIFIER` is something like 8ef1bd2601579e98
`THUNDERBAY_DOMAIN` is for the sample instance `acapulco.dimension.it`

Here is a sample *curl* command
```
curl -i -H "Content-Type: application/json" -d '{"device":{"identifier":"7757834C-D540-46A0-81A1-E4DE4B233838", "token":"71bfb7c572e7d81624c3475dd187f2909aae6377ff5e2d630e14abca818955ff", "lat":12.12312312, "lon":53.12321353, "locale":"it", "name":"Device Name"}}' -X POST  http://THUNDERBAY_DOMAIN/apps/APPLICATION_IDENTIFIER/devices
```

The return value will be a JSON object as confirmation.

#### Mark as Received

The application can provide feedback to ThunderBay as soon as the message is received.

```
http://THUNDERBAY_DOMAIN/apps/APPLICATION_IDENTIFIER/devices/DEVICE_IDENTIFIER/messages/PUSH_IDENTIFIER/received
```

`DEVICE_IDENTIFIER` is the value you provided in when registering like `7757834C-D540-46A0-81A1-E4DE4B233838`
`PUSH_IDENTIFIER` is a progressive value that will be received by the device inside the push notification payload.

Here is a sample *curl* command
```
curl -i  -H "Content-Type: application/json" -X POST  http://THUNDERBAY_DOMAIN/apps/APPLICATION_IDENTIFIER/devices/DEVICE_IDENTIFIER/messages/PUSH_IDENTIFIER/received
```

#### Mark as Red

The application can provide feedback to ThunderBay as soon as the message is red.

```
http://THUNDERBAY_DOMAIN/apps/APPLICATION_IDENTIFIER/devices/DEVICE_IDENTIFIER/messages/PUSH_IDENTIFIER/red
```

`DEVICE_IDENTIFIER` is the value you provided in when registering like `7757834C-D540-46A0-81A1-E4DE4B233838`
`PUSH_IDENTIFIER` is a progressive value that will be received by the device inside the push notification payload.

Here is a sample *curl* command
```
curl -i  -H "Content-Type: application/json" -X POST  http://THUNDERBAY_DOMAIN/apps/APPLICATION_IDENTIFIER/devices/DEVICE_IDENTIFIER/messages/PUSH_IDENTIFIER/red
```

---

## Creators

ThunderBay has been developed with love in Trento, Italy by [DIMENSION S.r.l.](http://dimension.it).

### Contributors

[Matteo Gavagnin](http://github.com/macteo) ([@macteo](https://twitter.com/macteo))

## License

ThunderBay is released under the MIT license.
