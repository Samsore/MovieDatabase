<?php

Class User_Authentication extends CI_Controller {

public function __construct() {

	parent::__construct();	

    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    //we need to start session in order to access it through CI

	// Load form helper library
	$this->load->helper('form');

	// Load form validation library
	$this->load->library('form_validation');

	    if(!isset($_SESSION)) { 
		// Load session library
			$this->load->library('session');
		}
	// Load database
	$this->load->model('login_database');

	}

// Show login page
public function index() {
	$this->load->view('pages/login_form');
}

// Show registration page
public function user_registration_show() {
	$this->load->view('templates/header');
	$this->load->view('pages/registration_form');
	$this->load->view('templates/footer');
}

// Validate and store registration data in database
public function new_user_registration() {

// Check validation for user input in SignUp form
$this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean');
$this->form_validation->set_rules('email_value', 'Email', 'trim|required|xss_clean');
$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');

if ($this->form_validation->run() == FALSE) {
	$this->load->view('templates/header');
	$this->load->view('pages/registration_form');
	$this->load->view('templates/footer');
} else {
	$data = array(
	'username' => $this->input->post('username'),
	'email' => $this->input->post('email_value'),
	'pass' => $this->input->post('password')
);

$result = $this->login_database->registration_insert($data);

if ($result == TRUE) {
	$data['message_display'] = 'Registration Successfully !';
	$this->load->view('templates/header');
	$this->load->view('pages/login_form');
	$this->load->view('templates/footer');
} else {
	$data['message_display'] = 'Username already exist!';
	$this->load->view('templates/header');
	$this->load->view('pages/registration_form');
	$this->load->view('templates/footer');
}
}
}

// Check for user login process
public function user_login_process() {

$this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean');
$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');

if ($this->form_validation->run() == FALSE) {
if(isset($this->session->userdata['logged_in'])){
	$this->load->view('templates/header');
	$this->load->view('admin_page');
	$this->load->view('templates/footer');
}else{
	$this->load->view('templates/header');
	$this->load->view('pages/login_form');
	$this->load->view('templates/footer');
}
} else {
$data = array(
	'username' => $this->input->post('username'),
	'password' => $this->input->post('password')
);
$result = $this->login_database->login($data);
if ($result == TRUE) {

$username = $this->input->post('username');
$result = $this->login_database->read_user_information($username);
if ($result != false) {
	$session_data = array(
	'username' => $result[0]->username,
	'email' => $result[0]->email,
	);
	// Add user data in session
	$this->session->set_userdata('logged_in', $session_data);
	$this->load->view('templates/header');
	$this->load->view('pages/admin_page');
	$this->load->view('templates/footer');
}
} else {
	$data = array(
	'error_message' => 'Invalid Username or Password'
	);
	$this->load->view('templates/header');
	$this->load->view('pages/login_form');
	$this->load->view('templates/footer');
}
}
}

// Logout from admin page
public function logout() {

	// Removing session data
	$sess_array = array(
	'username' => ''
	);
	$this->session->unset_userdata('logged_in', $sess_array);
	$data['message_display'] = 'Successfully Logout';
	$this->load->view('templates/header');
	$this->load->view('pages/login_form');
	$this->load->view('templates/footer');
	}

}
?>