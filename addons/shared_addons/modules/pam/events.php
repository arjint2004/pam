<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Pam Event Class - this class loads the configuration files js and css
 * 
 * @package		PyroCMS
 * @subpackage          Jqlightbox
 * @category            events
 * @author		Bojan Mazej
 */

class Events_Pam
{
    protected $ci;
    
    public function __construct()
    {
        $this->ci =& get_instance();
        
        // register the public_controller event when this file is autoloaded
        Events::register('public_controller', array($this, 'run'));
     }
    
    // this will be triggered by the Events::trigger('public_controller') code in Public_Controller.php
    public function run()
    {
        $this->ci->load->model(array('pam/pams_m'));

        // get settings
        $settings = $this->ci->pams_m->get_settings();
                
        // add path to module assets
	// MODIFY THIS PATH IF YOU'D LIKE TO KEEP THE MODULE ELSEWHERE
	Asset::add_path('pam', 'addons/shared_addons/modules/pam/');
        
        if($settings->jquery == 1)
        {
            $this->ci->template->append_js('pam::jquery.min.js');
        }
                
        $this->ci->template->append_js('pam::jquery.nivo.pams.pack.js');
        $this->ci->template->append_css(array('pam::nivo-pams.css'));
        
        $this->ci->template->append_css(array('pam::nivo-pams.theme.css'));
    }
}