<div class="one_full">
	<section class="title">
		<h4>Pembukuan Keuangan</h4>
	</section>

	<section class="item">
		<div class="content">
		<fieldset id="filters">
			<legend>Filters & Search</legend>
			<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud simpanjaringan" id="simpanjaringan"'); 
			if(!isset($_POST['bulan'])){@$_POST['bulan']=date('m');}
			?>
				<ul>
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
		<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud simpanjaringan" id="simpanjaringan"'); //pr($pelanggan);?>
				<style>
				input[type="text"], input[type="password"], textarea {
					margin: 0;
				}
				</style>

				<div class="buttons" >
					<button class="btn blue" id="btn_edir_member" value="save" name="simpan" type="submit">
						<span>Simpan</span>
					</button>
					<button class="btn blue" onclick="javascript:location='<?=base_url('admin/pam/tambah_transaksi');?>'" id="btn_edir_member" value="save" name="simpan" type="button">
						<span>Tambah Transaksi</span>
					</button>
				</div><br />	
				<? //pr($neraca);
					$totdebit=0;
					$totkredit=0;
				?>
				<table cellspacing="0">
					<thead>
						<tr>
							<th>No</th>
							<th>Tanggal</th>
							<th>Rekening</th>
							<th>Debit</th>
							<th>Kredit</th>
							<th>Saldo</th>
							<th>Keterangan</th>
							<th>Print</th>
							
						</tr>
					</thead>
					<tbody>
						<?php $i=1;foreach ($neraca as $dataneraca) { 
							$x=$dataneraca['id'];
							$totdebit=$totdebit+$dataneraca['debit'];
							$totkredit=$totkredit+$dataneraca['kredit'];
							$saldo=$totdebit-$totkredit;
						?>
							<tr>
								<td><?php echo $i++;?></td>
								<td><?=$dataneraca['tanggal']?></td>
								<td><?=$dataneraca['nama']?> (<?=$dataneraca['kode_rek']?>)</td>
								<td><?=$dataneraca['debit']?></td>
								<td><?=$dataneraca['kredit']?></td>
								<td><?=$saldo?></td>
								<td><?=$dataneraca['keterangan']?></td>
								<td>
								<? if($dataneraca['file']!=''){?>
								<a href="<?=base_url('admin/pam/print_transaksi').'/'.base64_encode($dataneraca['file'])?>">Print</a>
								<? } ?>
								</td>
								
							</tr>
						<?php } ?>
					</tbody>
				</table>

			<div class="buttons" >
				<button class="btn blue" id="btn_edir_member" value="save" name="simpan" type="submit">
					<span>Simpan</span>
				</button>
			</div>	
			<?php echo form_close(); ?>			
		</div>
	</section>
</div>