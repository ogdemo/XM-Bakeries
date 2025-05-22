<?php
include './lib/layout/layout.php';
if(!isset($_SESSION['user'])) {
    header('location:auth-signin');
}
?>



<div class="p-32">
    <p>Profile</p>
</div>


<!-- //footer -->
<?php include './lib/components/footer.php'; ?>

</body>

</html>