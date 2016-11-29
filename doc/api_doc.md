# API Documentation

## Tasks to Handle
1. Create user  
1. Create clinic  
2. Authenticate user  
    - JWT Token  
4. Authenticated User WaitTime  
5. Clinics data JSON  

## API Path
__Edit__ : any PUT-like calls  
___Base___:  /api/v1  

## __users__  
POST /users -- creates new user  
```
{
    "user" : {
        email: "",
        password: ""
    }
}

### Response
```
Success (201)  
```
SUCCESS
```
Fail (422)  
```
{
  "errors": {
    "password": [
      "should be at least 5 character(s)"
    ],
    "email": [
      "has invalid format"
    ]
  }
}
```




__login__  
POST /login -- authentication and return JWT user can use  

__clinics__  
POST /clinics/  
GET /clinics  
GET /clinics/:id  


__waittime__  
POST /clinics/waitTime/:id  


TODO: need a new controller that can aggrigate data with control
