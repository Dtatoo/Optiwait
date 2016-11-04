# Database Migrations  

## User users  
email:unique  
hashed_password  
is_admin:boolean  
### required  
email, password, is_admin
### default  
is_admin:false  

## Clinic clinics  
name  
location  
about  
user_id:references:users  
### required  
name, location

## Location locations  
clinic_id:references:clinics - has_one
place_id  
address  
city  
province  
country  

## Hour Hours  
weekday:integer  
star_hour:time  
end_hour:time  
closed:boolean  
clinic_id:references:clinics  
### required

### default
closed:false


## Wait_Time wait_times  
time:integer  
