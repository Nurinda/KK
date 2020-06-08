<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    
</head>
<body>
    <h3>Jumlah Admin: <?php echo $JumlahAdmin ?></h3>
    <h3>Jumlah Warga: <?php echo $JumlahWarga ?></h3>
    <h3>Jumlah Keluarga: <?php echo $jumlahKeluarga ?> </h3>

    <h1>data warga</h1>
	<?php echo anchor('crud/tambah','Tambah Data'); ?>
	<table style="margin:20px auto;" border="1">
		<tr>
			<th>No</th>
			<th>Nama</th>
			<th>Alamat</th>
			<th>Pekerjaan</th>
			<th>Action</th>
		</tr>
		<?php 
		$no = 1;
		foreach($warga as $u){ 
		?>
		<tr>
			<td><?php echo $no++ ?></td>
			<td><?php echo $u->nama ?></td>
			<td><?php echo $u->alamat ?></td>
			<td><?php echo $u->pekerjaan ?></td>
			<td>
                <?php echo anchor('crud/edit/'.$u->nik,'Edit'); ?>
                <?php echo anchor('crud/hapus/'.$u->nik,'Hapus'); ?>
			</td>
		</tr>
		<?php } ?>
    </table>
    

    <h1>data lengkap</h1>
    <table>
        <tbody>
            <tr>
                <td>Usia Minimal:</td>
                <td><input type="text" id="min" name="min"></td>
            </tr>
            <tr>
                <td>Usia Maksimal:</td>
                <td><input type="text" id="max" name="max"></td>
            </tr>
        </tbody>        
    </table>
    <table id="lengkap" style="margin:20px auto;">
        <thead>
            <tr>
                <th>No</th>
                <th class="selectFilter">ID KK</th>
                <th class="ageFilter">Usia</th>
                <th class="selectFilter">Pekerjaan</th>
                <th>Action</th>
            </tr>            
        </thead>
        <tbody>
            <?php $no = 1;
            foreach($lengkap as $l){?>
            <tr>
                <td><?php echo $no++ ?></td>
                <td><?php echo $l->id_keluarga ?></td>
                <td><?php echo $l->usia ?></td>
                <td><?php echo $l->pekerjaan ?></td>
                <td>
                    <?php echo anchor('crud/edit/'.$l->nik,'Edit'); ?>
                    <?php echo anchor('crud/hapus/'.$l->nik,'Hapus'); ?>
                </td>
            </tr>
            <?php } ?>
        </tbody>
        <tfoot>
            <tr>
                <th>No</th>
                <th>ID KK</th>
                <th>Usia</th>
                <th>Pekerjaan</th>
                <th>Action</th>
            </tr>
        </tfoot>
    </table>

    
    <script>

        // MULAI SEARCH BETWEEN AGE //
        $.fn.dataTable.ext.search.push(
            function( settings, data, dataIndex ) {
                var min = parseInt( $('#min').val(), 10 );
                var max = parseInt( $('#max').val(), 10 ); //parsing string ke integer
                var age = parseFloat( data[2] ) || 0; // urutan kolom usia             
                
                if ( ( isNaN( min ) && isNaN( max ) ) ||
                ( isNaN( min ) && age <= max ) ||
                ( min <= age   && isNaN( max ) ) ||
                ( min <= age   && age <= max ) )
                {
                    return true;
                }
            return false;
        }
        );


        $(document).ready(function() {
            $('#lengkap').DataTable({
                initComplete: function () {
                    //API untuk filter kolom dengan dropdown
                    this.api().columns('.selectFilter').every( function () {
                        var column = this;
                        var select = $('<select><option value=""></option></select>')
                            .appendTo( $(column.footer()).empty() )
                            .on( 'change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );
                            column.search( val ? '^'+val+'$' : '', true, false )
                                .draw();
                            } );
                        column.data().unique().sort().each( function ( d, j ) {
                            select.append( '<option value="'+d+'">'+d+'</option>' )
                        } );
                    } );

                }
            });
            
            // Event listener untuk menerima range usia secara realtime
            $('#min, #max').keyup( function() {
                var table = $('#lengkap').DataTable();
                table.draw();
            } );
        } );
        
        // SELESAI SEARCH BETWEEN AGE //
    </script>
    
</body>
</html>