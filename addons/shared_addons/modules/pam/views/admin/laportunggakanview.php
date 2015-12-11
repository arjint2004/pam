<script>
								$(document).ready(function(){
									$("table tr td#actionsl a").click(function(){
											var obj=$(this);
											$.ajax({
													type: "POST",
													data: '<?php echo $this->security->get_csrf_token_name();?>=<?php echo $this->security->get_csrf_hash(); ?>&',
													url: $(obj).attr('href'),
													beforeSend: function() {
														$(obj).after("<img id='waittugas9' style='margin:0;'  src='<?=base_url().'loading.png';?>' />");
													},
													success: function(msg) {
														$("#waittugas9").remove();
														location.reload();
													}
											});
											return false;
									});
								});
</script>
<div class="one_full">
	<section class="title">
		<h4>Data Penagihan</h4>
	</section>
	<? //pr($datapenagihan);?>
	<section class="item">
		<div class="content">
		<fieldset id="filters">
			<legend>Filters & Search</legend>
			<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud simpanjaringan" id="simpantagihan"'); 
					if(!isset($_POST['bulan'])){
						$_POST['bulan']=date('m')-1;
					}
					if(!isset($_POST['tahun'])){
						$_POST['tahun']=date('Y');
					}			
			?>
				<ul>
					<li class="">
						<label for="f_status">Alamat</label>
						<select name="alamat" onchange="return submit();">
							<option <?if(@$_POST['alamat']==1){echo 'selected';}?> value="1">Gamplong 1</option>
							<option <?if(@$_POST['alamat']==2){echo 'selected';}?> value="2">Gamplong 2</option>
							<option <?if(@$_POST['alamat']==3){echo 'selected';}?> value="3">Gamplong 3</option>
							<option <?if(@$_POST['alamat']==4){echo 'selected';}?> value="4">Gamplong 4</option>
							<option <?if(@$_POST['alamat']==5){echo 'selected';}?> value="5">Gamplong 5</option>
						</select>
					</li>
					<li class="">
						<label for="f_status">Bulan</label>
						<select name="bulan" onchange="return submit();">
							<option <?if(@$_POST['bulan']==1){echo 'selected';}?> value="1">Januari</option>
							<option <?if(@$_POST['bulan']==2){echo 'selected';}?> value="2">February</option>
							<option <?if(@$_POST['bulan']==3){echo 'selected';}?> value="3">Maret</option>
							<option <?if(@$_POST['bulan']==4){echo 'selected';}?> value="4">April</option>
							<option <?if(@$_POST['bulan']==5){echo 'selected';}?> value="5">Mei</option>
							<option <?if(@$_POST['bulan']==6){echo 'selected';}?> value="6">Juni</option>
							<option <?if(@$_POST['bulan']==7){echo 'selected';}?> value="7">Juli</option>
							<option <?if(@$_POST['bulan']==8){echo 'selected';}?> value="8">Agustus</option>
							<option <?if(@$_POST['bulan']==9){echo 'selected';}?> value="9">September</option>
							<option <?if(@$_POST['bulan']==10){echo 'selected';}?> value="10">Oktober</option>
							<option <?if(@$_POST['bulan']==11){echo 'selected';}?> value="11">November</option>
							<option <?if(@$_POST['bulan']==12){echo 'selected';}?> value="12">Desember</option>
						</select>
					</li>
					<li class="">
						<label for="f_status">Tahun</label>
						<select name="tahun" onchange="return submit();">
							<? for($y=2015;$y<date('Y')+2;$y++){?>
							<option <?if(@$_POST['tahun']==$y){echo 'selected';}?> value="<?=$y?>"><?=$y?></option>
							<? } ?>
						</select>
					</li>
				</ul>
			<?php echo form_close(); ?>
		</fieldset>
				<table cellspacing="0">
					<thead>
						<tr>							
							<th width="20"></th>
							<th>No</th>
							<th>Alamat</th>
							<th class="collapse">Nama</th>
							<th class="collapse">Bulan</th>
							<th width="180">Bayar</th>
						</tr>
					</thead>
					<tbody>
					<? $cf=1;foreach($datapenagihan as $datapenagihanres){?>
							<tr>
								<td></td>
								<td><?=$cf++?></td>
								<td>Gamplong <?=$datapenagihanres['alamat']?></td>
								<td><?=$datapenagihanres['nama']?></td>
								<td><? 
								$ddt=explode('-',$datapenagihanres['bulan']); 
								echo date("F", mktime(0, 0, 0, $ddt[1]  ,$ddt[2] , $ddt[0])).' ';
								echo date("Y", mktime(0, 0, 0, $ddt[1]  ,$ddt[2] , $ddt[0]));
								?></td>
								<td><?=$datapenagihanres['harus_bayar']?></td>
							</tr>
					<? 
					$total=$total+$datapenagihanres['harus_bayar'];
					} ?>
						<tr>
							<td colspan="5" style="text-align:  right;">TOTAL</td>
							<td><b><?=$total?></b></td>
						</tr>
					</tbody>
				</table>

			<div class="buttons" >
				<button class="btn blue" id="btn_edir_member" value="save" name="simpan" type="submit">
					<span>Simpan</span>
				</button>
			</div>	
		</div>
	</section>
</div>