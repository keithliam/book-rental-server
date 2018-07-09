# Book Rental Bot Server API

A DialogFlow webhook created for Messenger using [Graph API](https://developers.facebook.com/docs/graph-api/).

## Get list of users

Request:
```
GET /api/users
```
Response: __200__
```json
{
    "data": [
        {
            "id": "1",
            "name": "keith"
        },
        {
            "id": "10",
            "name": "lyka"
        },
        {
            "id": "11",
            "name": "angel"
        }
    ]
}
```



## Get list of groups

Request:
```
GET /api/groups
```
Response: __200__
```json
{
    "data": [
    {
        "name": "supervisors",
        "users": [
        {
            "id": "13",
            "name": "almer"
        }]
    },
    {
        "name": "interns",
        "users": [
        {
            "id": "1",
            "name": "keith"
        },
        {
            "id": "10",
            "name": "lyka"
        }]
    }]
}
```

## Add a group

Request:
```json
POST /api/groups

{
    "name": "supervisors",
    "users": ["12", "13"]
}
```
Response: __200__

## Delete a group

Request:
```
DELETE /api/groups/:name
	Example: DELETE /api/groups/supervisors
```
Response: __200__

## Message a user

Request:
```json
POST /api/message-user

{
    "id": "3",
    "message": "This is a message"
}
```
Response: __200__

## Message users

Request:
```json
POST /api/message-user

{
    "id": ["1","32","42"],
    "message": "This is a message"
}
```
Response: __200__

## Message a group

Request:
```json
POST /api/message-group

{
	"name": "supervisors",
	"message": "This is a message"
}
```
Response: __200__

## Broadcast

Request:
```
POST /api/broadcast
```
Response: __200__
