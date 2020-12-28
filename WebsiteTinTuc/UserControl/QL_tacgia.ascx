<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QL_tacgia.ascx.cs" Inherits="WebsiteTinTuc.QL_tacgia" %>
<%--datapicker--%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div class="mg-top">
    <table class="table">
        <tr>
            <td>Tên Tác Giả</td>

            <td>
                <asp:TextBox ID="txtTacGia" runat="server" CssClass="input"></asp:TextBox>
                &emsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtTacGia" ValidationGroup="check"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>Ngày Sinh</td>

            <td>
                <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="input datepicker"></asp:TextBox>
                &emsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNgaySinh" ValidationGroup="check"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>SĐT</td>

            <td>
                <asp:TextBox ID="txtSDT" runat="server" CssClass="input"></asp:TextBox>
                &emsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSDT" ValidationGroup="check"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="số điện thoại không hợp lệ" ForeColor="Red" ControlToValidate="txtSDT" ValidationGroup="Check" ValidationExpression="(09|03|07|08|05)+([0-9]{8})"></asp:RegularExpressionValidator>
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
        <asp:GridView ID="tabletacgia" ClientIDMode="Static" runat="server" CssClass="display cell-border" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="IDTG" HeaderText="ID" />
                <asp:BoundField DataField="TenTG" HeaderText="Tên Tác Giả" />
                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" />
                <asp:BoundField DataField="SDT" HeaderText="SĐT" />
            </Columns>
        </asp:GridView>
    </div>

    <script type="text/javascript">
       
        //code chay table
        $(document).ready(function () {
            $("#tabletacgia").DataTable({

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

        $('#tabletacgia tbody').on('click', 'tr', function () {
            var s = $(this).closest("tr").find("td").first().text().trim();

            writeCookie("id", s, 1);
            window.location.href = "/TacGia/TG/";
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

        $(document).ready(function () {
            $('.datepicker').datepicker({ dateFormat: 'dd/mm/yy' });
        });

    </script>

</div>
