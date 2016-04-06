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
                $data['title'] = 'profile archive';
                $data['randProfile'] = $this->profile_model->rand_profile();

                $this->load->view('templates/header', $data);
                $this->load->view('profile/index', $data);
                $this->load->view('templates/footer');
        }

        public function view()
        {
                $data['profile_item'] = $this->profile_model->get_profile();
                if (empty($data['profile_item']))
                {
                        show_404();
                }

                $data['title'] = $data['profile_item']['title'];

                $this->load->view('templates/header', $data);
                $this->load->view('profile/view', $data);
                $this->load->view('templates/footer');
        }

        public function create()
        {
                $this->load->helper('form');
                $this->load->library('form_validation');

        $data['title'] = 'Create a profile item';

        $this->form_validation->set_rules('title', 'Title', 'required');
        $this->form_validation->set_rules('text', 'Text', 'required');

        if ($this->form_validation->run() === FALSE)
        {
                $this->load->view('templates/header', $data);
                $this->load->view('profile/create');
                $this->load->view('templates/footer');

        }
        else
        {
                $this->profile_model->set_profile();
                $this->load->view('profile/success');
        }
    }
}