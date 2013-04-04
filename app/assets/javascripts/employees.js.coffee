# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@emplCtrl = ($scope, employeesDB) ->
  $scope.employees = employeesDB.query()
  $scope.state = 1

  $scope.clearFrm = ->
    $scope.em = new Object
    $scope.em.login = "New User Login"
    $scope.em.surname = "New User Surname"
    $scope.em.name = "New User Name"
    $scope.state = 1

  $scope.saveEmpl = ->
    $("#xaxa").hide()
    $("#xaxa2").hide()
    $scope.em = new Object if !$scope.em
    employeesDB.save({}, $scope.em, (resource) ->
      $scope.employees.push(resource)
    , (response) ->
      console.log("Failed")
    )

  $scope.editEmpl = (e_id) ->
    $scope.state = 2
    $scope.em = new Object if !$scope.em
    employeesDB.get({id: e_id}, (resource) ->
      $scope.em = resource
      $scope.editID = resource.id
    , (response) ->
        console.log("Failed")
    )

  $scope.updateEmpl = ->
    if $scope.editID >= 0
      console.log($scope.editID)
      employeesDB.update({id: $scope.editID}, $scope.em, (resource) ->
        console.log(resource)
        $scope.employees = employeesDB.query()
      , (response) ->
        console.log("Failed")
      )

  $scope.delEmpl = (e_id) ->
    employeesDB.delete({id: e_id}, (resource) ->
      console.log("Deleted id:" + e_id)
      $scope.employees = employeesDB.query()
    , (response) ->
      console.log("Failed to delete")
    )

  $scope.test = ->
    alert("test")


@app.directive("superman", () ->
  return {
  restrict: "E",
  template: "<div>Hello</div>"
  }
)

###
  $scope.editEmployee = (e_id) ->
    Entry.delete({id: e_id}, (resource) ->
      console.log("Deleted id:" + e_id)
      $scope.rowempls = Entry.query()
    , (response) ->
      console.log("Failed to delete")
    )
###