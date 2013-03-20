# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@warCtrl = ($scope, rowemplsDB, employeesDB, warehousesDB, hardwaretypesDB) ->
  $scope.state = 1
  $scope.editID = -1
  $scope.rowempls = rowemplsDB.query()
  $scope.employees = employeesDB.query()
  $scope.warehouses = warehousesDB.query()
  $scope.hardwaretypes = hardwaretypesDB.query()

  $("#pdate").datepicker({
    dateFormat: "dd-mm-yy"
    numberOfMonths: 1,
    #showCurrentAtPos: 12
    onSelect: (seldate, obj) ->
      $scope.w = new Object if !$scope.w
      $scope.w.pdate = seldate;
  })

  $scope.clearFrm = ->
    $scope.w = new Object
    $scope.w.name = "New PC Name"
    $scope.w.serial = ""
    $scope.w.hardwaretype_id = 1
    $scope.w.pdate = ""
    $scope.w.apps = ""
    $scope.w.specs = ""
    $scope.w.notes = ""

    $scope.editID = -1

  $scope.saveWare = ->
    $scope.w = new Object if !$scope.w
    warehousesDB.save({}, $scope.w, (resource) ->
      console.log $scope.warehouses.push(resource)
      console.log resource
      tmp = new Object
      tmp.warehouse_id = resource.id
      tmp.employee_id = $scope.w.employee_id
      console.log tmp
      rowemplsDB.save({}, tmp, (resource2) ->
        $scope.rowempls = rowemplsDB.query()
        console.log "Success"
      , (response2) ->
        console.log("Failed saving the employee row")
      )
    , (response) ->
      console.log("Failed Saving")
    )

  $scope.editWare = (e_id) ->
    $scope.w = new Object if !$scope.w
    warehousesDB.get({id: e_id}, (resource) ->
      $scope.w = resource
      #alert($scope.w.pdate.getFullYear())
      $scope.editID = resource.id
      $scope.state = 2
      tmp = new Date($scope.w.pdate)
      $scope.w.pdate = tmp.format("dd-mm-yyyy")
      console.log $scope.w
    , (response) ->
      console.log("Failed")
    )

  $scope.updateWare = ->
    if $scope.editID >= 0
      console.log($scope.editID)
      warehousesDB.update({id: $scope.editID}, $scope.w, (resource) ->
        console.log(resource)
        $scope.warehouses = warehousesDB.query()
      , (response) ->
        console.log("Failed")
      )

  $scope.delWare = (e_id) ->
    warehousesDB.delete({id: e_id}, (resource) ->
      console.log("Deleted id:" + e_id)
      $scope.warehouses = warehousesDB.query()
    , (response) ->
      console.log("Failed to delete")
    )

  $scope.checkWSel = (id) ->
    if $scope.w
      if id == $scope.w.hardwaretype_id
        return true
    return false

  $scope.addEmployee = ->
    if $scope.employee_id?
      newE =
        warehouse_id: $scope.editID
        employee_id: $scope.employee_id

      e = rowemplsDB.save(newE)
      $scope.rowempls.push(e)
    else
      alert("Please select an employee first")

  $scope.delEmployee = (e_id) ->
    rowemplsDB.delete({id: e_id}, (resource) ->
      console.log("Deleted id:" + e_id)
      $scope.rowempls = rowemplsDB.query()
    , (response) ->
      console.log("Failed to delete")
    )

  $scope.getEmployeeName = (data) ->
    str = ""

    if data.warehouse_id == $scope.editID
      for e in $scope.employees
        if data.employee_id == e.id
          tmp = new Date(data.created_at)
          str = e.surname + " " + e.name + " " + tmp.format("dd-mm-yyyy")
          return str

  $scope.test = ->
    alert("test")
