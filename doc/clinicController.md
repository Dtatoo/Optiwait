# Clinic Controller Comment file

__Goals__  
1. Insert clinic properties  
2. Edit clinic properties  


## Inserting (New Clinic)
clinic data have following types  

```
name :: String
about :: String
hours :: [Hour]
location :: Location
user_id :: Int

```
Location, and Hour have their own schemda-model, and changeset defined seperate from Clinic.  

Hour type is somewhat special because input will come as []  
