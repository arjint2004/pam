<div class="one_full">
	<section class="title">
		<h4>Neraca Keuangan</h4>
	</section>

	<section class="item">
		<div class="content">
		<fieldset id="filters">
			<legend>Filters & Search</legend>
			<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud simpanjaringan" id="simpanjaringan"'); 
			if(!isset($_POST['tahun'])){@$_POST['tahun']=date('Y');}
			?>
				<ul>
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
								<a href="<?=base_url('admin/pam/print_transaksi').'/'.$dataneraca['id']?>">Print</a>
								<? } ?>
								</td>
								
							</tr>
						<?php 
						$totd=$totd+$dataneraca['debit'];
						$totk=$totk+$dataneraca['kredit'];
						} ?>
						<tr>
							<td colspan="3">Total</td>
							<td><b><?=$totd?></b></td>
							<td><b><?=$totk?></b></td>
							<td><b><?=$totd-$totk?></b></td>
							<td colspan="2"></td>
						</tr>
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