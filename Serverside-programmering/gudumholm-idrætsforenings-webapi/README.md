# Gudumholm Idrætsforening
## REST API
### Sports
#### GET /sports
Parameters:
* id: string
#### PUT /sports
Parameters:
* name: string
* price: int
#### POST /sports
Parameters:
* name: string
* price: int
#### DELETE /sports
Parameters:
* id: string
  
### Addresses
#### GET /addresses
Parameters:
* id: string
#### PUT /addresses
Parameters:
* road: string
* city: string
* zipcode: string
#### POST /addresses
Parameters:
* road: string
* city: string
* zipcode: string
#### DELETE /addresses
Parameters:
* id: string

### Members
#### GET /members
Parameters:
* id: string
#### PUT /members
Parameters:
* name: string
* CPR: string
* membership: string
* sportId: int
* addressId: int
#### POST /members
* name: string
* CPR: string
* membership: string
* sportId: int
* addressId: int
#### DELETE /members
Parameters:
* id: string

### Kids
#### GET /kids
Parameters:
* id: string