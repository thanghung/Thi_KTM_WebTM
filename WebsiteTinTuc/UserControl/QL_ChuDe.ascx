<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QL_ChuDe.ascx.cs" Inherits="WebsiteTinTuc.QL_ChuDe" %>

 <%--Datatable--%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

<div class="mg-top">
    <table class="table">
        <tr>
            <td>Chủ Đề</td>

            <td>
                <asp:TextBox ID="txtChuDe" runat="server" CssClass="input"></asp:TextBox>
                &emsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtChuDe" ValidationGroup="check"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-info" ValidationGroup="Check" OnClick="btnThem_Click" OnClientClick="if(!confirm('Dữ liệu sẽ được thêm vào ?')) return false;" />&emsp;
            <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" CssClass="btn btn-success" ValidationGroup="Check" OnClick="btnCapNhat_Click" OnClientClick="if(!confirm('Dữ liệu sẽ được cập nhật ?')) return false;" />&emsp;
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-danger" ValidationGroup="Check" OnClick="btnXoa_Click" OnClientClick="if(!confirm('Dữ liệu sẽ bị xóa ?')) return false;" />&emsp;
            </td>
        </tr>
    </table>
</div>

<div class="col-12 mg-top">
    <div class="col-12 background">
        <div class="pd"></div>
        Hiển Thị Dữ Liệu
                 <div class="pd"></div>
    </div>

    <div class="col-12" style="margin-top: 10px;">
        <asp:GridView ID="TableChuDe" ClientIDMode="Static" runat="server" CssClass="display cell-border" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="IDCD" HeaderText="ID" />
                <asp:BoundField DataField="TenChuDe" HeaderText="Chủ Đề" />
            </Columns>
        </asp:GridView>
    </div>

    <script type="text/javascript">
        //code chay table
        $(document).ready(function () {
            $("#TableChuDe").DataTable({

                language: {
                    "sProcessing": "Đang xử lý...",
                    "sLengthMenu": "Xem _MENU_ mục",
                    "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
                    "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                    "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                    "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                    "sInfoPostFix": "",
                    "sSearch": "Tìm Kiếm:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "Đầu",
                        "sPrevious": "Trước",
                        "sNext": "Tiếp",
                        "sLast": "Cuối"
                    }
                },
            });
        });

        $('#TableChuDe tbody').on('click', 'tr', function () {
            var s = $(this).closest("tr").find("td").first().text().trim();

            writeCookie("id", s, 1);
            window.location.href = "/ChuDe/CD/";
        });

        function writeCookie(name, value, days) {
            var date, expires;
            if (days) {
                date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toGMTString();
            } else {
                expires = "";
            }
            document.cookie = name + "=" + value + expires + "; path=/";
        }
    </script>

</div>
