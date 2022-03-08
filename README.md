![tamara-menzi-nQksYvlKxCo-unsplash](https://user-images.githubusercontent.com/69017022/157337902-5f61641c-4c6d-4b18-895e-fcac28cc5fdc.jpg)
# SWEATER WEATHER
You are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements.

----------

### Set Up
On your local system, open a terminal session to run the following commands:
1. Clone this repository `$ git clone git@github.com:Malllll12/sweater-weather.git`
2. Navigate to the newly cloned directory `$ cd sweater-weather`
3. If bundler is not installed run `$ gem install bundler`
4. If or after bundler is installed run `$ bundle install` to install the required Gems
5. If errors occur, check for proper installation and versions of `bundler`, `ruby`, and `rails`
6. Set up the database locally with `$ rails db:{:drop,:create,:migrate,:seed}`
7. Open your text editor and check to see that `schema.rb` exists
8. You may also run the RSpec test suite locally with the command `$ bundle exec rspec` to ensure everything is functioning as expected.

----------

### Versions

- Ruby 2.7.2
- Rails 5.2.6

----------

## Gems
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) 
- Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails), [faker](https://github.com/vajradog/faker-rails), [webmock](https://github.com/bblimke/webmock), [vcr](https://github.com/vcr/vcr)

- API: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers), [figaro](https://medium.com/@MinimalGhost/the-figaro-gem-an-easier-way-to-securely-configure-rails-applications-c6f963b7e993)
----------

## Learning Goals for Project:

- Use microservices to address individual functions 
- Expose APIs
- Consume APIs
- Use serializers to format JSON respons

----------

## API


### Forcast Endpoint
| http verb | name | description | example |
| --- | --- | --- | --- |
| GET | /forecast | Returns current, daily and hourly forecast | /api/v1/forecast?location=denver,co |

<details>
  <summary> JSON response examples </summary>

  Forecast by location:
```
  {
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "dt": "2022-08-03 16:08:16 -0700",
                "sunrise": "2022-08-03 06:22:28 -0700",
                "sunset": "2022-08-03 17:59:10 -0700",
                "temperature": 38.89,
                "feels_like": 38.89,
                "humidity": 27,
                "uvi": 0.67,
                "visibility": 10000,
                "conditions": "clear sky",
                "icon": "01d"
            },
            "daily_weather": [
                {
                    "date": "2022-08-03 12:00:00 -0700",
                    "sunrise": "2022-08-03 06:22:28 -0700",
                    "sunset": "2022-08-03 17:59:10 -0700",
                    "max_temp": 38.89,
                    "min_temp": 20.25,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-09-03 12:00:00 -0700",
                    "sunrise": "2022-09-03 06:20:54 -0700",
                    "sunset": "2022-09-03 18:00:13 -0700",
                    "max_temp": 28.31,
                    "min_temp": 16.97,
                    "conditions": "light snow",
                    "icon": "13d"
                },
                {
                    "date": "2022-10-03 12:00:00 -0700",
                    "sunrise": "2022-10-03 06:19:20 -0700",
                    "sunset": "2022-10-03 18:01:16 -0700",
                    "max_temp": 24.75,
                    "min_temp": 14.38,
                    "conditions": "snow",
                    "icon": "13d"
                },
                {
                    "date": "2022-11-03 12:00:00 -0700",
                    "sunrise": "2022-11-03 06:17:45 -0700",
                    "sunset": "2022-11-03 18:02:18 -0700",
                    "max_temp": 33.84,
                    "min_temp": 14.29,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-12-03 12:00:00 -0700",
                    "sunrise": "2022-12-03 06:16:09 -0700",
                    "sunset": "2022-12-03 18:03:20 -0700",
                    "max_temp": 53.56,
                    "min_temp": 27.77,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "16:00:00",
                    "temp": 38.89,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "17:00:00",
                    "temp": 37.92,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "18:00:00",
                    "temp": 35.83,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "19:00:00",
                    "temp": 33.78,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "20:00:00",
                    "temp": 31.59,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "21:00:00",
                    "temp": 29.91,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "22:00:00",
                    "temp": 29.57,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "23:00:00",
                    "temp": 29.3,
                    "conditions": "broken clouds",
                    "icon": "04n"
                }
            ]
        }
    }
}
```
</details>

### Background Endpoint
| http verb | name | description | example |
| --- | --- | --- | --- |
| GET | /backgrounds | Returns image based on location  | /api/v1/backgrounds?location=denver,co |

<details>
  <summary> JSON response examples </summary>

  Image by location:
```
  {
    "data": {
        "type": "image",
        "id": "null",
        "attributes": {
            "image": {
                "location": null,
                "description": "Boho Girl\n\nModel : @peanutphysique",
                "image_url": "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMDc2Mzl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NDY3NzU4MjY&ixlib=rb-1.2.1&q=85",
                "site": "www.unsplash.com",
                "credit": {
                    "photographer": "Taylor Daugherty",
                    "photographer_site": "https://unsplash.com/@tayloradaugherty"
                }
            }
        }
    }
}
  ```
</details>

### User Endpoint
| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /users | Returns user email and API key | /api/v1/users |

<details>
  <summary> JSON response examples </summary>

  User:
```
{
    "data": {
        "id": "324",
        "type": "users",
        "attributes": {
            "email": "fake@example.com",
            "api_key": "notarealkey"
        }
    }
}
  ```
</details>

### Log in Endpoint
| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /users | Returns logged in user email and API key | /api/v1/sessions |

<details>
  <summary> JSON response examples </summary>

  Session:
```
{
    "data": {
        "id": "324",
        "type": "users",
        "attributes": {
            "email": "fake@example.com",
            "api_key": "notarealkey"
        }
    }
}
  ```
</details>

### Roadtrip Endpoint
| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /road_trip | Returns user email and API key | /api/v1/road_trip |

<details>
  <summary> JSON response examples </summary>

  Roadtrip:
```
{
    "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Montrose,CO",
            "travel_time": "04:44:25",
            "weather_at_eta": {
                "temperature": 31.59,
                "conditions": "few clouds"
            }
        }
    }
}
  ```
</details>
