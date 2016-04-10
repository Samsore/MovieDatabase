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

	    if (empty($data['results'])){
        	$this->load->view('pages/result/no_result',$data);     
        }
        else{
        	$this->load->view('pages/result',$data);
        }
        $this->load->view('templates/footer', $data);
	}

	public function movie($search_term){
		if (isset($this->session->userdata['logged_in'])){
			$username = ($this->session->userdata['logged_in']['username']);
		}
		$search_term = str_replace('-', ' ', $search_term);
		$search_term = urldecode($search_term);

		$data['results'] = $this->home_model->get_results($search_term);
		$data['actors']	 = $this->home_model->get_actor($search_term);
		$data['director']= $this->home_model->get_director($search_term);
		$data['rating']  = $this->home_model->get_rating($search_term);
		$data['movieid']  = $this->home_model->get_movie_id($search_term);
		$data['userid']  = $this->home_model->get_user_id($username);
		$data['comments'] = $this->home_model->get_comments($search_term);

       	$this->load->view('templates/header', $data);
        $this->load->view('pages/movie',$data);
	    $this->load->view('templates/footer', $data);
	}

	public function actor($firstname, $lastname){
		$data['actors']	  = $this->home_model->get_actor_name($firstname,$lastname);
		$data['birthday'] = $this->home_model->get_actor_birthdate($firstname,$lastname);
		$data['roles'] = $this->home_model->get_actor_roles($lastname);

       	$this->load->view('templates/header', $data);
        $this->load->view('pages/actor',$data);
	    $this->load->view('templates/footer', $data);
	}
	public function comment_success($comment){
		$search_term = $this->input->post('comment');


            $data = array(
                'movieid' => $this->input->post('movieid'),
                'userid'  => $this->input->post('userid'),
                'comment' => $this->input->post('comment')
            );

            return $this->db->insert('user_movie', $data);

       	$this->load->view('templates/header', $data);
        $this->load->view('pages/movie',$data);
	    $this->load->view('templates/footer', $data);
	}
}