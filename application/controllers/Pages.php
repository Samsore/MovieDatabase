<?php
class Pages extends CI_Controller {

        public function __construct()
        {
                parent::__construct();
                $this->load->model('home_model');
                $this->load->helper('url_helper');
                $this->load->helper('form');
        }

	public function view($page = 'home')
	{
	        if ( ! file_exists(APPPATH.'/views/pages/'.$page.'.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = ucfirst($page); // Capitalize the first letter

	        //Random front page movie get
			$data['movie'] = $this->home_model->rand_movie();

	       	$this->load->view('templates/header', $data);
	        $this->load->view('pages/'.$page, $data);
	        $this->load->view('templates/footer', $data);
	}

	public function result(){
		$search_term = $this->input->post('search');
		$data['results'] = $this->home_model->get_results($search_term);
        // Pass the results to the view.
       	$this->load->view('templates/header', $data);
        $this->load->view('pages/result',$data);
	    $this->load->view('templates/footer', $data);
	    if (empty($data['results']))
            {
                    show_404();            
            }
	}

	public function movie($search_term){
		$data['results'] = $this->home_model->get_results($search_term);	
       	$this->load->view('templates/header', $data);
        $this->load->view('pages/movie',$data);
	    $this->load->view('templates/footer', $data);
	}
}