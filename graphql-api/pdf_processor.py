from langchain_community.document_loaders import PyPDFLoader
from langchain.text_splitter import TokenTextSplitter


def pdf_split(path, chunk_size, chunk_overlap):
    loader = PyPDFLoader(path)
    pages = loader.load_and_split()
    text_splitter = TokenTextSplitter(chunk_size=chunk_size, chunk_overlap=chunk_overlap)
    documents_pdf = text_splitter.split_documents(pages)
    return documents_pdf
