/**
 * 
 */
function adminMemberDelete(username) {
		$.ajax({
			url: "adminMemberDelete",
			data:{"username": username},
			method: "POST",
			async: false,
			success: function() {
				alert("회원이 삭제되었습니다.")
				window.location.reload();
			},
			error: function(error) {
				console.log(error);
			}
		});
	}
	
$(document).ready( function () {
	$('#datatablesSimple').DataTable();
} );

new DataTable('#datatablesSimple', {
	order: false
});