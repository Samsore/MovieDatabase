<?php
class Results extends CI_Controller {

        public function __construct()
        {
                parent::__construct();
                $this->load->model('news_model');
                $this->load->helper('url_helper');
        }



	public function results($page = 'results'){
		$data['actor'] = $this->Movie_Model->get_actor();
            if (empty($data['news_item']))
            {
                    show_404();            
            }

        $this->load->view('templates/header', $data);
        $this->load->view('news/view', $data);
        $this->load->view('templates/footer');
	}
}