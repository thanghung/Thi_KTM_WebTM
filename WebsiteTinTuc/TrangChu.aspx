<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="WebsiteTinTuc.TrangChu1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <%--Datatable--%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <div class="mg-top">
            <table class="table">
                <tr>
                    <td>Tiêu Đề</td>

                    <td>
                        <asp:TextBox ID="txtTieuDe" runat="server" CssClass="input"></asp:TextBox>
                        &emsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtTieuDe" ValidationGroup="check"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Nội Dung</td>

                    <td>
                        <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" Width="300px" Height="200px"></asp:TextBox>
                        &emsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNoiDung" ValidationGroup="check"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Mã Tác Giả</td>

                    <td>
                        <asp:TextBox ID="txtTacGia" runat="server" CssClass="input"></asp:TextBox>
                        &emsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtTacGia" ValidationGroup="check"></asp:RequiredFieldValidator>
                    </td>
                </tr>

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
                <asp:GridView ID="TableTinTuc" ClientIDMode="Static" runat="server" CssClass="display cell-border" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" />
                        <asp:BoundField DataField="TieuDe" HeaderText="Tiêu Đề" />
                        <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" />
                        <asp:BoundField DataField="NgayDang" HeaderText="Ngày Đăng" />
                        <asp:BoundField DataField="TenTG" HeaderText="Tác Giả" />
                        <asp:BoundField DataField="ChuDe" HeaderText="Chủ Đề" />
                    </Columns>
                </asp:GridView>
            </div>

            <script type="text/javascript">
                //code chay table
                $(document).ready(function () {
                    $("#TableTinTuc").DataTable({

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

                $('#TableTinTuc tbody').on('click', 'tr', function () {
                    var s = $(this).closest("tr").find("td").first().text().trim();

                    window.location.href = "/TrangChu/" + s;
                });

            </script>

        </div>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </asp:Panel>
</asp:Content>
