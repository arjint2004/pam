<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package 		PyroCMS
 * @subpackage 		Pams Widget
 * @author			Michael Giuliana
 *
 * Display a pams configured in the Pam Module
 *
 * Usage : on a CMS page add {widget_area('name_of_area')}
 * where 'name_of_area' is the name of the widget area you created in the admin control panel
 */

class Widget_Pams extends Widgets
{
	public $title		= array(
		'en' => 'Pams',
	);
	public $description	= array(
		'en' => 'Display a Nivo Pams on your website.',
	);

	public $author		= 'Michael Giuliana';
	public $website		= 'http://rpnzl.com';
	public $version		= '1.1';

	public $fields = array(
		array(
			'field' => 'pams_id',
			'label' => 'Pams',
		),
		array(
			'field' => 'theme',
			'label' => 'Theme',
		),
		array(
			'field' => 'effect',
			'label' => 'Effect',
		),
		array(
			'field' => 'captions',
			'label' => 'Captions',
		),
		array(
			'field' => 'animSpeed',
			'label' => 'Animation Speed',
		),
		array(
			'field' => 'pauseTime',
			'label' => 'Pause Time',
		),
		array(
			'field' => 'directionNav',
			'label' => 'Direction Nav',
		),
		array(
			'field' => 'directionNavHide',
			'label' => 'Direction Nav Hide',
		),
		array(
			'field' => 'controlNav',
			'label' => 'Control Nav',
		),
		array(
			'field' => 'controlNavThumbs',
			'label' => 'Show Thumbnails',
		),
		array(
			'field' => 'keyboardNav',
			'label' => 'Keyboard Nav',
		),
		array(
			'field' => 'pauseOnHover',
			'label' => 'Pause On Hover',
		),
		array(
			'field' => 'manualAdvance',
			'label' => 'Manual Advance',
		),
		array(
			'field' => 'slices',
			'label' => 'Slices',
		),
		array(
			'field' => 'boxCols',
			'label' => 'Box Columns',
		),
		array(
			'field' => 'boxRows',
			'label' => 'Box Rows',
		),
	);

        private $themes = array('none' => 'None', 'default' => 'NivoDefault', 'orman' => 'Orman', 'pascal' => 'Pascal');
        private $pams_effect = array(
					'sliceDown' => 'Slice Down',
					'sliceDownLeft' => 'Slice Down Left',
					'sliceUp' => 'Slice Up',
					'sliceUpLeft' => 'Slice Up Left',
					'sliceUpDown' => 'Slice Up Down',
					'sliceUpDownLeft' => 'Slice Up Down Left',
					'fold' => 'Fold',
					'fade' => 'Fade',
					'random' => 'Random',
					'slideInRight' => 'Slide In Right',
					'slideInLeft' => 'Slide In Left',
					'boxRandom' => 'Box Random',
					'boxRain' => 'Box Rain',
					'boxRainReverse' => 'Box Rain Reverse',
					'boxRainGrow' => 'Box Rain Grow',
					'boxRainGrowReverse' => 'Box Rain Grow Reverse',
				);
        
	public function form($options)
	{

		// load classes, libs
		$this->load->library(array('files/files'));
		$this->load->model(array(
			'pam/pams_m',
			'files/file_folders_m',
			'files/file_m',
		));

		// get settings
		$settings = $this->pams_m->get_settings();

		// get child folders of main module folder
		$folders = $this->db->order_by('sort', 'asc')->get_where('file_folders', array('id' => $settings->folder_id))->result();
		
		// define the folder dropdown array
		$select_pams = array();
		foreach($folders as $folder)
		{
			$query = $this->db->get_where('files', array('folder_id' => $folder->id, 'type' => 'i'));
			$count = count($query->result()) > 1 ? ' ['.count($query->result()).' images]' : ' ['.count($query->result()).' image]';
			$select_pams[$folder->id] = $folder->name . $count;
		}

		
		// get pams and images
		$folder = $this->file_folders_m->get($options['pams_id']);
		$images = $this->db->order_by('sort', 'asc')->get_where('files', array('folder_id' => $folder->id, 'type' => 'i'))->result();

		
		// option defaults
		!empty($options['pams_id'])				OR $options['pams_id'] = null;
		!empty($options['captions'])				OR $options['captions'] = 'false';
		!empty($options['theme'])					OR $options['theme'] = 'default';
		!empty($options['effect'])					OR $options['effect'] = 'fade';
		!empty($options['animSpeed'])				OR $options['animSpeed'] = 500;
		!empty($options['pauseTime'])				OR $options['pauseTime'] = 3000;
		!empty($options['directionNav'])			OR $options['directionNav'] = 'true';
		!empty($options['directionNavHide'])		OR $options['directionNavHide'] = 'true';
		!empty($options['controlNav'])				OR $options['controlNav'] = 'true';
		!empty($options['controlNavThumbs'])		OR $options['controlNavThumbs'] = 'false';
		!empty($options['keyboardNav'])				OR $options['keyboardNav'] = 'true';
		!empty($options['pauseOnHover'])			OR $options['pauseOnHover'] = 'true';
		!empty($options['manualAdvance'])			OR $options['manualAdvance'] = 'false';
		!empty($options['slices'])					OR $options['slices'] = 15;
		!empty($options['boxCols'])					OR $options['boxCols'] = 8;
		!empty($options['boxRows'])					OR $options['boxRows'] = 4;

		// return the good stuff
		return array(
			'options'           => $options,
			'images'           => $images,
			'select_pams'     => $select_pams,
                        'themes'            => $this->themes,
                        'pams_effect'     => $this->pams_effect
		);
	}


	public function run($options)
	{
		// load classes, libs
		$this->load->library(array('files/files'));
		$this->load->model(array(
			'pam/pams_m',
			'files/file_folders_m',
			'files/file_m',
		));

		// get settings
		$settings = $this->pams_m->get_settings();

		// get pams and images
		$folder = $this->file_folders_m->get($options['pams_id']);
		$images = $this->db->order_by('sort', 'asc')->get_where('files', array('folder_id' => $folder->id, 'type' => 'i'))->result();

		// check that the images descriptions are valid urls
		for($i = 0; $i < count($images); $i++)
		{
			$images[$i]->description = preg_match('|^http(s)?://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|i', $images[$i]->description) ? $images[$i]->description : null;
		}

		// return vars
		return array(
			'options'	=> $options,
			'pams'	=> $folder,
			'images'	=> $images,
		);
	}
}
