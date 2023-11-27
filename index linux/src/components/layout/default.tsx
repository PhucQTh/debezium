import React from "react";
import Header from "src/components/layout/header";
import Footer from "src/components/layout/footer";
interface ILayoutProps {
  children: React.ReactNode;
  title?: string;
}

const DefaultLayout: React.FC<ILayoutProps> = ({ children }) => {
  return (
    <div>
      <Header />
      <div
        style={{
          fontSize: "1.6rem",
          minHeight: "75vh",
          justifyContent: "center",
          width: "100%",
          paddingInline: "20px",
        }}
      >
        {children}
      </div>
      <Footer />
    </div>
  );
};

export default DefaultLayout;
