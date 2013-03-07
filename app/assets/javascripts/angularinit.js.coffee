@app = angular.module("Mathra", ["ngResource"])
@app.factory "rowemplsDB", ($resource) ->
  $resource("/rowempls/:id", {id: "@id"},
    {update: {method: "PUT"}}
  )

@app.factory "employeesDB", ($resource) ->
  $resource("/employees/:id", {id: "@id"}, {update: {method: "PUT"}},
    {destroy: {method: "DELETE"}}
  )

@app.factory "warehousesDB", ($resource) ->
  $resource("/warehouses/:id", {id: "@id"}, {update: {method: "PUT"}},
    {destroy: {method: "DELETE"}}
  )

@app.factory "hardwaretypesDB", ($resource) ->
  $resource("/hardwaretypes/:id", {id: "@id"}, {update: {method: "PUT"}},
    {destroy: {method: "DELETE"}}
  )

@app.filter("prn2", ->
  (data) ->
    str = "aa"
    return str
)
