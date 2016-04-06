Imports System.Data
Imports System.Data.SqlClient


Partial Class inicio
    Inherits System.Web.UI.Page

    Private sql As SqlConnection
    Private correoUsuario As String

    Sub New()
        sql = New SqlConnection("Data Source=laboratoriohads.database.windows.net;Initial Catalog=Lab;Persist Security Info=True;User ID=adminhads;Password=A1s2d3f4")
    End Sub



    Function loguear() As Boolean

        Dim correo As String = txtUsuario.Text
        Dim pass As String = txtPassword.Text

        Dim da As New SqlDataAdapter("select * from usuarios where correo='" & correo & "' and password='" & pass & "'", sql)
        Dim ds As New Data.DataSet
        da.Fill(ds)

        Dim filas As Integer = ds.Tables(0).Rows.Count

        If filas = 1 Then
            Dim c As String = Trim(ds.Tables(0).Rows(0)("correo"))
            Dim activado As String = Trim(ds.Tables(0).Rows(0)("activado"))

            If activado = 1 Then

                correoUsuario = c

                Return True
            Else
                Return False
            End If
        Else
            Return False
        End If


    End Function


    Protected Sub btnLoguear_Click(sender As Object, e As EventArgs) Handles btnLoguear.Click

        If loguear() Then
            Session("usuario") = txtUsuario.Text

            Response.Redirect("/usuarios.aspx")
        Else
            lblError.Visible = True
        End If

    End Sub
    Protected Sub btnRegistro_Click(sender As Object, e As EventArgs) Handles btnRegistro.Click
        Response.Redirect("registro.aspx")
    End Sub
    Protected Sub btnCambiarPassword_Click(sender As Object, e As EventArgs) Handles btnCambiarPassword.Click

        If loguear() Then

            Response.Redirect("/cambiarpassword.aspx?correo=" & correoUsuario)
        Else
            lblError.Visible = True
        End If

    End Sub

    Protected Sub txtPassword_TextChanged(sender As Object, e As EventArgs) Handles txtPassword.TextChanged

    End Sub
End Class
