declare module '@apiverve/jsonschemagenerator' {
  export interface jsonschemageneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface jsonschemageneratorResponse {
    status: string;
    error: string | null;
    data: JSONSchemaGeneratorData;
    code?: number;
  }


  interface JSONSchemaGeneratorData {
      schema:     Schema;
      sampleData: SampleData;
  }
  
  interface SampleData {
      name:   string;
      age:    number;
      email:  string;
      active: boolean;
  }
  
  interface Schema {
      schema:     string;
      title:      string;
      type:       string;
      properties: Properties;
      required:   string[];
  }
  
  interface Properties {
      name:   Active;
      age:    Active;
      email:  Email;
      active: Active;
  }
  
  interface Active {
      type: string;
  }
  
  interface Email {
      type:   string;
      format: string;
  }

  export default class jsonschemageneratorWrapper {
    constructor(options: jsonschemageneratorOptions);

    execute(callback: (error: any, data: jsonschemageneratorResponse | null) => void): Promise<jsonschemageneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: jsonschemageneratorResponse | null) => void): Promise<jsonschemageneratorResponse>;
    execute(query?: Record<string, any>): Promise<jsonschemageneratorResponse>;
  }
}
