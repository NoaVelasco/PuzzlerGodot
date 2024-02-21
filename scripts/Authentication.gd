extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Firebase.Auth.login_succeeded.connect(on_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(on_signup_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_signup_failed)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_log_in_button_pressed():
	var email = %Email.text
	var password = %Password.text
	Firebase.Auth.login_with_email_and_password(email, password)
	%LoginLabel.text = "Logging in"

func _on_sign_up_button_pressed():
	var email = %Email.text
	var password = %Password.text
	Firebase.Auth.signup_with_email_and_password(email, password)
	%LoginLabel.text = "Signing up"


func on_login_succeeded(auth):
	pass
	
func on_signup_succeeded(auth):
	pass
	
func on_login_failed(error_code, message):
	pass
	
func on_signup_failed(error_code, message):
	pass
	
	
