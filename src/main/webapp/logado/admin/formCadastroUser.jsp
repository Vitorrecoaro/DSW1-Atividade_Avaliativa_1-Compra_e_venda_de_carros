<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UFT-8">
                <title>Cadastro de usuários</title>
                <style type="text/css">
                    legend {
                        width: 80%;
                        text-align: center;
                    }


                    .formulario_de_usuario {
                        font-style: oblique;
                        font-size: 45px;
                        display: flex;
                        margin: 0 auto;
                        justify-content: center;
                        padding-top: 5%;
                    }

                    label {
                        display: block;
                        margin-bottom: 15px;
                    }

                    #sexo {
                        font-size: 18px;
                    }

                    #nascimento {
                        font-size: 18px;
                    }

                    #botao {
                        margin-left: 35%;
                        font-size: 20px;
                    }
                </style>

            </head>

            <body>

                <c:if test="${mensagens.existeErros}">
                    <div id="erro">
                        <ul>
                            <c:forEach var="erro" items="${mensagens.erros}">
                                <li> ${erro} </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>

                <form class="formulario_de_usuario" method="post" action="novoUsuario">
                    <fieldset>
                        <legend>Cadastro do usuário</legend>

                        <label>E-mail
                            <input required id="email" type="email" name="email" placeholder="email@email.com" />
                        </label>

                        <label>Senha
                            <input required id="senha" type="password" name="senha" />
                        </label>

                        <label>CPF
                            <input required id="cpf" type="text" name="cpf" placeholder="XXXXXXXXX-XX" maxlength="11"
                                onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode))) return true; else return false;">
                        </label>

                        <label>Nome
                            <input required id="nome" type="text" name="nome">
                        </label>

                        <label>Telefone
                            <input required id="telefone" type="tel" name="telefone" placeholder="(XX)XXXXX-XX"
                                maxlength="11"
                                onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode))) return true; else return false;">
                        </label>

                        <label>Sexo
                            <select required id="sexo" name="sexo">
                                <option value="M">Masculino</option>
                                <option value="F">Feminino</option>
                            </select>
                        </label>

                        <label>Data de Nascimento
                            <input required id="nascimento" type="date" name="dataNascimento">
                        </label>

                        <button type="submit" id="botao">
                            Cadastrar
                    </fieldset>
                    </button>
                </form>
            </body>

            </html>