#= require_self

#= require_tree ./controllers/experiences

Wbd = angular.module('Wbd',['flash','ngRoute'])

Wbd.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
	
Wbd.config(['$routeProvider','$locationProvider',($routeProvider,$locationProvider) -> 
  
  $locationProvider.html5Mode true
  $routeProvider.when('/experience/new', {templateUrl: '/assets/createExperience.html', controller:'NewExperienceCtrl'})    	
  $routeProvider.when('/experience/:experienceId',{templateUrl: '/assets/experienceDetails.html', controller: 'ExperienceDetailCtrl'})
  $routeProvider.when('/experiences/:experienceId/edit',{templateUrl: '/assets/experienceEdit.html',controller: 'ExperienceEditCtrl'})
  $routeProvider.otherwise({templateUrl: '/assets/mainIndex.html', controller: 'ExperienceCtrl'})
  ])


