angular.module('Wbd').factory('postData', ['$http', 'flash', '$location' , ($http,flash,$location) ->

	postData =
		data:
			experiences: [{experience_name: 'Loading', special: '', budget:'', description:''}]
		isLoaded: false

	postData.createExperience = (newExperience) ->

		if newExperience.experience_name == '' 
			flash('Experience name must not be blank')
			return false

		data =
			new_experience:
				experience_name: newExperience.experience_name
				special: newExperience.special
				budget: newExperience.budget
				description: newExperience.description
		$http.post('/experiences',data).success((data) -> 
			postData.data.experiences.push(data)
			console.log('Successfully created post'	)
			$location.url('/experience/'+data.id)

		).error( ->
			console.error('Failed to create new post')
		)
		#alert(newExperience.special)
		return true	

	postData.updateExp = (newExperience) ->
		#alert(newExperience.experienceId)
		if newExperience.experience_name == '' 
			flash('Experience name must not be blank')
			return false

		data =
			new_experience:
				experience_name: newExperience.experience_name
				special: newExperience.special
				budget: newExperience.budget
				description: newExperience.description
		$http.post('/experiences/'+newExperience.experienceId,data).success((data) -> 
			postData.data.experiences.push(data)
			console.log('Successfully created post'	)
			#$location.url('/experience/'+data.experienceId)

		).error( ->
			console.error('Failed to create new post')
		)
		#alert(newExperience.special)
		return true	

	postData.deleteExperience = (experienceId) ->
		#alert(newExperience.experienceId)
		#data = experienceId
		$http.post('/experiences/'+experienceId+'/delete').success((data) -> 
			#postData.data.experiences.push(data)
			postData.data.experiences.splice(postData.data.experiences.indexOf(experienceId), 1)
			console.log('Successfully created post'	)

		).error( ->
			console.error('Failed to create new post')
		)
		#alert(newExperience.special)
		return true			

	postData.loadExperiences = (deferred) ->
		if !postData.isLoaded
			$http.get('/getjson.json').success( (data) ->
				postData.data.experiences = data
				postData.isLoaded = true
				console.log('Successfully loaded posts.')
				if deferred
					deferred.resolve()
			).error( ->
				console.error('Failed to load posts.')
				if deferred
					deferred.reject('Failed to load posts.')
			)
		else
			if deferred
				deferred.resolve()	
	return postData				
])