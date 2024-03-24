# Use the official Python image as a base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    STREAMLIT_SERVER_PORT=8501

# Set the working directory in the container
WORKDIR /app

COPY requirements.txt .
# Copy the Python files into the container

# Install any dependencies specified in requirements.txt
RUN python -m pip install --upgrade pip
# RUN pip install -r /app/requirements.txt
RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install streamlit
RUN pip install -r requirements.txt

COPY multipage /app/multipage

COPY multipage/pages/data_csv.csv /app/multipage/pages/data_csv.csv

COPY . .

# Expose the Streamlit port
EXPOSE 8501

# Run the Streamlit app when the container starts
CMD ["streamlit", "run", "/app/multipage/home.py"]