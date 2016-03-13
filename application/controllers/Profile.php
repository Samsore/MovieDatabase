<?php
class Profile extends CI_Controller {

        public function __construct()
        {
                parent::__construct();
                $this->load->model('profile_model');
                $this->load->helper('url_helper');
        }

       
       public function index()
{
        $data['profile'] = $this->profile_model->get_profile();
        $data['title'] = 'Profile archive';

        $this->load->view('templates/header', $data);
        $this->load->view('profile/index', $data);
        $this->load->view('templates/footer');
}
}