@ExperienceEditCtrl = ($scope, $routeParams, $location, $q,  postData) -> 
	$scope.data = 
		postData: postData.data
		currentExperience:
			experience_name: ''
			special: ''
			budget: ''
			description: ''



	#alert($routeParams.postId)
	#alert($routeParams.experienceId)
	$scope.data.experienceId = $routeParams.experienceId
	

	$scope.prepPostData = ->
    	experience = _.findWhere(postData.data.experiences, { id: parseInt($scope.data.experienceId) })
    	#$scope.data.currentExperience.experience_name = experience.experience_name
    	#$scope.data.currentExperience.special = experience.special
    	#$scope.data.currentExperience.budget = experience.budget
    	#$scope.data.currentExperience.description = experience.description
    	#alert(experience)
    	$scope.newExperience.experience_name = experience.experience_name
    	$scope.newExperience.special = experience.special
    	$scope.newExperience.budget = experience.budget
    	$scope.newExperience.description = experience.description

    @deferred = $q.defer()
    @deferred.promise.then($scope.prepPostData)

    #$scope.prepPostData()
    postData.loadExperiences(@deferred)

    $scope.newExperience = 
    	experienceId: parseInt($scope.data.experienceId)
		experience_name: ''
		special: ''
		budget: ''
		description: ''

	$scope.updateExp = ->
		postData.updateExp($scope.newExperience)

	#console.log($routeParams)

@ExperienceEditCtrl.inject = ['$scope', '$routeParams', 'postdata', '$location', '$q']	