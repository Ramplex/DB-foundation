"use client";

import React from "react";
import styled from "styled-components";

interface props{
    children: React.ReactNode;
}

function Global_Style({children}:props) {
    return <Global_Styles>{children}</Global_Styles>;
}

const Global_Styles = styled.div`
    padding: 2.5rem;
    display: flex;
    gap: 2.5rem;
    height: 100%;
`;

export default Global_Style;